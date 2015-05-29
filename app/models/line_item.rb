# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  comment    :text
#  g1         :integer
#  g1h        :integer
#  g2         :integer
#  g2h        :integer
#  g3         :integer
#  g3h        :integer
#  g4         :integer
#  g4h        :integer
#  g5         :integer
#  g5h        :integer
#  g6         :integer
#  g6h        :integer
#  g7         :integer
#  g7h        :integer
#  g8         :integer
#  g8h        :integer
#  g9         :integer
#  g9h        :integer
#  g10        :integer
#  g10h       :integer
#  g11        :integer
#  g11h       :integer
#  g12        :integer
#  g12h       :integer
#  g13        :integer
#  g13h       :integer
#  g14        :integer
#  g14h       :integer
#  g15        :integer
#  g16        :integer
#  vat        :decimal(, )
#  price      :decimal(8, 2)
#  created_at :datetime
#  updated_at :datetime
#  fmid       :integer
#

class LineItem < ActiveRecord::Base
  # associations
  belongs_to :order
  belongs_to :product

  # scopes
  scope :completed, -> { where(completed_at.present) }
  scope :order_by_created_desc, -> { order(created_at: :desc) }
  scope :webshop, -> { joins(:order).where(order: {is_webshop: true}) }

  # callbacks
  before_save :get_product_references

  # methods
  def get_product_references
    unless self.persisted?
      self.price = product.price
      self.vat = product.vat
    end
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

  def completed_at
    self.order.completed_at
  end

  def quantity
  	items = [g1, g1h, g2, g2h, g3, g3h, g4, g4h, g5, g5h, g6, g6h, g7, g7h, g8, g8h, g9, g9h, g10, g10h, g11, g11h, g12, g12h, g13, g13h, g14, g14h, g15, g16]
  	items.compact.sum
  end


  def quantity_share
    order_total = self.order.line_items.to_a.sum(&:quantity).to_f
    line_item_total = quantity.to_f

    width = line_item_total / order_total * 100
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
