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

class LineItem < ActiveRecord::Base
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
    self.product.price
  end

  def net_price_single
    discount = self.discounts.sum(:discount) || 0
    self.ref_price_single * (1 - discount)
  end

  def update_price
    self.price = self.net_price_single
  end

  def price_total
    q = quantity || 0
    p = price || 0
    (q * p).round(2)
  end

  def vat_total
    price_total * vat
  end

  def gross_total
    vat_factor = 1 + vat
    price_total * vat_factor
  end



  def quantity_label
    badge = "#{self.try(:product).try(:sku)} (#{quantity})"
  end
  
end
