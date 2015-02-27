# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  sku              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  price            :decimal(8, 2)
#  vat              :decimal(, )
#  color_text       :string(255)
#  variation_set_id :integer
#  size_id          :integer
#  fmid             :integer
#  primary_color    :string(255)
#  secondary_color  :string(255)
#  text_color       :string(255)      default("#fff")
#

class Product < ActiveRecord::Base
  # associations
  belongs_to :size
  belongs_to :variation_set
  has_many :line_items
  has_many :product_images, dependent: :destroy
  has_many :series, dependent: :destroy

  accepts_nested_attributes_for :product_images, :allow_destroy => true

  # scopes
  scope :only_model, ->(name) { where(name: name) }

  # validations
  validates	:name,	presence: true
  validates	:sku,		presence: true

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

  def sales_per_size
    line_items = self.line_items
    sizes = Size.column_names.delete_if{|column| ["id","name","created_at","updated_at"].include?(column)}

    sizes.map{ |size| [size, line_items.sum(size)] }.to_h
  end
  
end
