# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  finished_on :date
#  comment     :text
#  g1          :integer
#  g1h         :integer
#  g2          :integer
#  g2h         :integer
#  g3          :integer
#  g3h         :integer
#  g4          :integer
#  g4h         :integer
#  g5          :integer
#  g5h         :integer
#  g6          :integer
#  g6h         :integer
#  g7          :integer
#  g7h         :integer
#  g8          :integer
#  g8h         :integer
#  g9          :integer
#  g9h         :integer
#  g10         :integer
#  g10h        :integer
#  g11         :integer
#  g11h        :integer
#  g12         :integer
#  g12h        :integer
#  g13         :integer
#  g13h        :integer
#  g14         :integer
#  g14h        :integer
#  g15         :integer
#  g16         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :integer
#

class Series < ActiveRecord::Base
  # associations
  belongs_to :product

  # scopes
  scope :newest, -> { order(name: :desc) }

  # methods
  def quantities_as_array
    [
      g1,
      g1h,
      g2,
      g2h,
      g3,
      g3h,
      g4,
      g4h,
      g5,
      g5h,
      g6,
      g6h,
      g7,
      g7h,
      g8,
      g8h,
      g9,
      g9h,
      g10,
      g10h,
      g11,
      g11h,
      g12,
      g12h,
      g13,
      g13h,
      g14,
      g14h,
      g15,
      g16
    ]
  end

  def quantities_to_hash
    {
      product.size.g1 => g1,
      product.size.g1h => g1h,
      product.size.g2 => g2,
      product.size.g2h => g2h,
      product.size.g3 => g3,
      product.size.g3h => g3h,
      product.size.g4 => g4,
      product.size.g4h => g4h,
      product.size.g5 => g5,
      product.size.g5h => g5h,
      product.size.g6 => g6,
      product.size.g6h => g6h,
      product.size.g7 => g7,
      product.size.g7h => g7h,
      product.size.g8 => g8,
      product.size.g8h => g8h,
      product.size.g9 => g9,
      product.size.g9h => g9h,
      product.size.g10 => g10,
      product.size.g10h => g10h,
      product.size.g11 => g11,
      product.size.g11h => g11h,
      product.size.g12 => g12,
      product.size.g12h => g12h,
      product.size.g13 => g13,
      product.size.g13h => g13h,
      product.size.g14 => g14,
      product.size.g14h => g14h,
      product.size.g15 => g15,
      product.size.g16 => g16
    }
  end

  def total_quantity
    quantities_as_array.compact.sum
  end
end
