# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  sku               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  price             :decimal(8, 2)
#  vat               :decimal(, )
#  color_text        :string(255)
#  variation_set_id  :integer
#  fmid              :integer
#  primary_color     :string(255)
#  secondary_color   :string(255)
#  text_color        :string(255)      default("#fff")
#  size_set_id       :integer
#  product_family    :string
#  retail_price      :decimal(8, 2)
#  product_family_id :integer
#
# Indexes
#
#  index_products_on_product_family_id  (product_family_id)
#  index_products_on_size_set_id        (size_set_id)
#

class Product < ApplicationRecord
  attr_accessor :new_product_family_name

  # associations
  belongs_to :size_set
  belongs_to :product_family
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :material_consumptions, dependent: :destroy
  has_many :materials, through: :material_consumptions
  has_many :product_images, dependent: :destroy
  has_many :series, dependent: :destroy
  has_many :series_steps, through: :series
  has_many :series_step_entries, through: :series_steps, source: :entries
  has_many :product_inventory_items, dependent: :nullify

  accepts_nested_attributes_for :product_images, allow_destroy: true
  accepts_nested_attributes_for :material_consumptions, allow_destroy: true
  accepts_nested_attributes_for :series, allow_destroy: true
  accepts_nested_attributes_for :product_family

  # callbacks
  before_save :create_new_product_family

  # pg_search
  include PgSearch
  multisearchable against: [:name, :sku, :color_text]

  # scopes
  scope :only_model, ->(name) { where(name: name) }
  scope :only_family, -> (product_family_id) { where(product_family_id: product_family_id) } 

  # validations
  validates	:name,	presence: true
  validates	:sku,		presence: true

  # Methods
  def create_new_product_family
    create_product_family(name: new_product_family_name) unless new_product_family_name.blank?
  end

  def default_image
    if self.product_images.empty?
      "http://placehold.it/350&text=Nothing+here"
    else
      self.product_images.first.image.url(:medium)
    end
  end

  def full_name
    full_name = [ sku, name, color_text ]
    full_name.join(" - ")
  end

  def gross_retail_price
    ( retail_price || 0 ) * (1 + vat)
  end

  def sales_per_size
    line_items = self.line_items
    sizes = SizeSet.column_names.delete_if{|column| ["id","name","created_at","updated_at"].include?(column)}

    sizes.map{ |size| [size, line_items.sum(size)] }.to_h
  end

  def sizes_for_select(table: nil)
    if table
      size_set.sizes.map{|size| "COALESCE(SUM(#{table}.#{size}), 0) as #{size}"}.join(", ")
    else
      size_set.sizes.map{|size| "COALESCE(SUM(#{size}), 0) as #{size}"}.join(", ")
    end
  end

  def most_recent_inventory_date
    product_inventory_items.maximum(:entered_on) || "01.01.0001"
  end

  def inventory_total
    product_inventory_items.most_recent.select(sizes_for_select)[0].as_json.reject{|key, value| key == "id"}
  end

  def inventory(size)
    inventory_total.send(size) || 0
  end

  def sales_total
    line_items.completed_since(most_recent_inventory_date).select(sizes_for_select)[0].as_json.reject{|key, value| key == "id"}
  end

  def sales_backordered
    line_items.not_completed.select(sizes_for_select)[0].as_json.reject{|key, value| key == "id"}
  end

  def sales_backordered_values
    sales_backordered.values
  end

  def sales(size)
    sales_total.send(size) || 0
  end

  def production_total
    series_step_entries.completed_since(most_recent_inventory_date).select(sizes_for_select(table: "series_step_entries"))[0].as_json.reject{|key, value| key == "id"}
  end

  def production(size)
    production_total.send(size) || 0
  end

  def stock_hash
    added = inventory_total.merge(production_total){|key, inventory, production| (inventory || 0) + (production || 0)}
    reduced = sales_total

    stock = added.merge(reduced){|key, added, reduced| (added || 0) - (reduced || 0)}
  end

  def stock_array
    stock_hash.values
  end

  def available_stock_hash
    stock_hash.merge(sales_backordered){|key, stock, backordered| stock - backordered}
  end

  def available_stock(size)
    quantity = available_stock_hash[size]
    if quantity == 0
      nil
    else
      quantity
    end
  end

  def available_stock_array
    available_stock_hash.values
  end

  def available_stock_sum
    available_stock_array.compact.sum
  end
  
end
