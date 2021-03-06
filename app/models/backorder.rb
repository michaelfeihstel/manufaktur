# == Schema Information
#
# Table name: backorders
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  g1         :integer          default(0)
#  g1h        :integer          default(0)
#  g2         :integer          default(0)
#  g2h        :integer          default(0)
#  g3         :integer          default(0)
#  g3h        :integer          default(0)
#  g4         :integer          default(0)
#  g4h        :integer          default(0)
#  g5         :integer          default(0)
#  g5h        :integer          default(0)
#  g6         :integer          default(0)
#  g6h        :integer          default(0)
#  g7         :integer          default(0)
#  g7h        :integer          default(0)
#  g8         :integer          default(0)
#  g8h        :integer          default(0)
#  g9         :integer          default(0)
#  g9h        :integer          default(0)
#  g10        :integer          default(0)
#  g10h       :integer          default(0)
#  g11        :integer          default(0)
#  g11h       :integer          default(0)
#  g12        :integer          default(0)
#  g12h       :integer          default(0)
#  g13        :integer          default(0)
#  g13h       :integer          default(0)
#  g14        :integer          default(0)
#  g14h       :integer          default(0)
#  g15        :integer          default(0)
#  g16        :integer          default(0)
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_backorders_on_order_id    (order_id)
#  index_backorders_on_product_id  (product_id)
#

class Backorder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # METHODS
  def backorder_as_array
    items = [g1, g1h, g2, g2h, g3, g3h, g4, g4h, g5, g5h, g6, g6h, g7, g7h, g8, g8h, g9, g9h, g10, g10h, g11, g11h, g12, g12h, g13, g13h, g14, g14h, g15, g16]
  end

  def backorder_as_hash
    {
      g1: g1,
      g1h: g1h,
      g2: g2,
      g2h: g2h,
      g3: g3,
      g3h: g3h,
      g4: g4,
      g4h: g4h,
      g5: g5,
      g5h: g5h,
      g6: g6,
      g6h: g6h,
      g7: g7,
      g7h: g7h,
      g8: g8,
      g8h: g8h,
      g9: g9,
      g9h: g9h,
      g10: g10,
      g10h: g10h,
      g11: g11,
      g11h: g11h,
      g12: g12,
      g12h: g12h,
      g13: g13,
      g13h: g13h,
      g14: g14,
      g14h: g14h,
      g15: g15,
      g16: g16
    }
  end

  def backorder_as_compact_hash
    backorder_as_hash.delete_if {|key, value| value.nil? }
  end

  def quantity
    backorder_as_array.compact.sum
  end
end