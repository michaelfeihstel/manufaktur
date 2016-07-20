# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  product_id   :integer
#  comment      :text
#  g1           :integer
#  g1h          :integer
#  g2           :integer
#  g2h          :integer
#  g3           :integer
#  g3h          :integer
#  g4           :integer
#  g4h          :integer
#  g5           :integer
#  g5h          :integer
#  g6           :integer
#  g6h          :integer
#  g7           :integer
#  g7h          :integer
#  g8           :integer
#  g8h          :integer
#  g9           :integer
#  g9h          :integer
#  g10          :integer
#  g10h         :integer
#  g11          :integer
#  g11h         :integer
#  g12          :integer
#  g12h         :integer
#  g13          :integer
#  g13h         :integer
#  g14          :integer
#  g14h         :integer
#  g15          :integer
#  g16          :integer
#  vat          :decimal(, )
#  price        :decimal(8, 2)
#  created_at   :datetime
#  updated_at   :datetime
#  fmid         :integer
#  completed_at :datetime
#
# Indexes
#
#  index_line_items_on_completed_at  (completed_at)
#  index_line_items_on_created_at    (created_at)
#  index_line_items_on_order_id      (order_id)
#  index_line_items_on_product_id    (product_id)
#

class LineItem < ApplicationRecord
  # associations
  belongs_to :order
  belongs_to :product
  has_many :discounts, dependent: :destroy

  accepts_nested_attributes_for :discounts, allow_destroy: true

  # scopes
  scope :completed, -> { where.not( line_items: { completed_at: nil } ) }
  scope :not_completed, -> { where( line_items: { completed_at: nil } ) }
  scope :completed_since, -> (date) { where("line_items.completed_at >= ?", date) }
  scope :completed_between, -> (from, to) { where("completed_at BETWEEN ? AND ?", from, to) }
  scope :most_recent, -> { order(created_at: :desc) }
  scope :webshop, -> { joins(:order).where(order: {is_webshop: true}) }

  # callbacks

  # methods
  def get_product_references
    price = self.price || product.price
  end

  def temp_id
    rand(1000000)
  end

  def product_name
    if self.product
      "#{self.product.name} (#{self.product.color_text})"
    else
      id
    end 
  end

  def quantity
    items = [g1, g1h, g2, g2h, g3, g3h, g4, g4h, g5, g5h, g6, g6h, g7, g7h, g8, g8h, g9, g9h, g10, g10h, g11, g11h, g12, g12h, g13, g13h, g14, g14h, g15, g16]
    items.compact.sum
  end

  def ref_price_single
    self.try(:product).try(:price) || 0
  end

  def net_price_single
    discount = self.discounts.enabled.sum(:discount) || 0
    self.ref_price_single * (1 - discount)
  end

  def update_price
    self.price = self.net_price_single
  end

  def price_total
    q = quantity || 0
    p = price || 0
    q * p
  end

  def vat_total
    (price_total || 0) * (vat || 0)
  end

  def gross_total
    vat_factor = 1 + (vat || 0)
    price_total * vat_factor
  end

  def quantity_label
    badge = "#{try(:product).try(:sku)} (#{quantity})"
  end

  def backorders
    Backorder.find_by(order_id: order_id, product_id: product_id)
  end

  def backordered?(size)
    Backorder.find_by(order_id: order_id, product_id: product_id).backorder_as_compact_hash.has_key?(size)
  end

  def self.monthly_sales_as_hash
    group_by_month(:completed_at).sum("COALESCE(g1, 0) + COALESCE(g1h, 0) + COALESCE(g2, 0) + COALESCE(g2h, 0) + COALESCE(g3, 0) + COALESCE(g3h, 0) + COALESCE(g4, 0) + COALESCE(g4h, 0) + COALESCE(g5, 0) + COALESCE(g5h, 0) + COALESCE(g6, 0) + COALESCE(g6h, 0) + COALESCE(g7, 0) + COALESCE(g7h, 0) + COALESCE(g8, 0) + COALESCE(g8h, 0) + COALESCE(g9, 0) + COALESCE(g9h, 0) + COALESCE(g10, 0) + COALESCE(g10h, 0) + COALESCE(g11, 0) + COALESCE(g11h, 0) + COALESCE(g12, 0) + COALESCE(g12h, 0) + COALESCE(g13, 0) + COALESCE(g13h, 0) + COALESCE(g14, 0) + COALESCE(g14h, 0) + COALESCE(g15, 0) + COALESCE(g16, 0)")
  end

  def self.monthly_sales_as_array
    monthly_sales_as_hash.values
  end
  
end
