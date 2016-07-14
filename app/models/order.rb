# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  delivered_on          :date
#  invoiced_at           :datetime
#  completed_at          :datetime
#  contact_id            :integer
#  billing_address_id    :integer
#  delivery_address_id   :integer
#  billing_name          :string(255)
#  billing_street        :string(255)
#  billing_house_number  :string(255)
#  billing_zip           :string(255)
#  billing_city          :string(255)
#  billing_country       :string(255)
#  delivery_name         :string(255)
#  delivery_street       :string(255)
#  delivery_house_number :string(255)
#  delivery_city         :string(255)
#  delivery_zip          :string(255)
#  delivery_country      :string(255)
#  delivery_iso          :string(255)
#  is_webshop            :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  marked                :boolean          default(FALSE), not null
#  fmid                  :integer
#  comment               :text
#  is_free               :boolean          default(FALSE)
#  is_vat_exempt         :boolean          default(FALSE)
#  paid_on               :date
#  paid_amount           :decimal(8, 2)
#  is_scheduled_delivery :boolean          default(FALSE)
#  cashback_until        :date
#  cashback_percent      :decimal(2, 2)    default(0.03)
#  tax_id                :integer
#  shipping_cost         :decimal(8, 2)    default(0.0)
#  payment_method        :string
#
# Indexes
#
#  index_orders_on_billing_address_id   (billing_address_id)
#  index_orders_on_completed_at         (completed_at)
#  index_orders_on_contact_id           (contact_id)
#  index_orders_on_created_at           (created_at)
#  index_orders_on_delivery_address_id  (delivery_address_id)
#  index_orders_on_tax_id               (tax_id)
#

class Order < ApplicationRecord
  
  # RELATIONS
  belongs_to :billing_address, foreign_key: "billing_address_id", class_name: "Address"
  belongs_to :contact
  belongs_to :delivery_address, foreign_key: "delivery_address_id", class_name: "Address"
  belongs_to :tax
  has_many :comments, as: :commentable
  has_many :backorders
  has_many :line_items, dependent: :destroy
  has_many :discounts, through: :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_many :sizes, through: :products
  has_many :shipments, dependent: :destroy
  
  accepts_nested_attributes_for :line_items, allow_destroy: true
  accepts_nested_attributes_for :shipments, allow_destroy: true

  # pg_search
  include PgSearch
  multisearchable against: [:id, :billing_name, :delivery_name]

  # VALIDATIONS

  # CALLBACKS
  before_save :get_address_references
  before_save :update_vat_on_line_items
  before_save :update_completed_at
  after_save :update_price

  def get_address_references
    self.billing_name = try(:billing_address).try(:name) || billing_name
    self.billing_street = try(:billing_address).try(:street) || billing_street
    self.billing_house_number = try(:billing_address).try(:house_number) || billing_house_number
    self.billing_zip = try(:billing_address).try(:zip) || billing_zip
    self.billing_city = try(:billing_address).try(:city) || billing_city
    self.billing_country = try(:billing_address).try(:country) || billing_country
    self.delivery_name = try(:delivery_address).try(:name) || delivery_name
    self.delivery_street = try(:delivery_address).try(:street) || delivery_street
    self.delivery_house_number = try(:delivery_address).try(:house_number) || delivery_house_number
    self.delivery_zip = try(:delivery_address).try(:zip) || delivery_zip
    self.delivery_city = try(:delivery_address).try(:city) || delivery_city
    self.delivery_country = try(:delivery_address).try(:country) || delivery_country
  end

  def update_vat_on_line_items
    if self.tax_id.present?
      vat = Tax.find(tax_id).value
      line_items.update_all(vat: vat)
    end
  end

  def update_completed_at
    if self.new_record? || self.completed_at_changed?
      line_items.update_all(completed_at: completed_at)
    end
  end

  def update_price
    line_items.each do |line_item|
      line_item.update_price
      line_item.save
    end
  end

  # SCOPES
  scope :favorites, -> { where(marked: true) }
  scope :scheduled, -> { where(is_scheduled_delivery: true) }
  scope :ordered_by, -> (customer_id) { where(customer_id: customer_id) }

  # RANSACK
  ransacker :quicksearch

  # METHODS
  def completed?
    if completed_at.present?
      true
    else
      false
    end
  end

  def quantity_total
    self.line_items.to_a.sum(&:quantity)
  end

  def price_total
    line_items.to_a.sum(&:price_total)
  end

  def vat_total
    self.line_items.to_a.sum(&:vat_total)
  end

  def gross_total
    self.line_items.to_a.sum(&:gross_total)
  end

  def price_cashback
    gross_total * (1 - cashback_percent)
  end

  def mark_as_marked
    if marked == true
      update_attributes(:marked => false)
    else
      update_attributes(:marked => true)
    end
  end

  def mark_as_completed
    if completed_at.blank?
      update_attributes(:completed_at => Time.now)
    else
      update_attributes(:completed_at => "")
    end
  end

end
