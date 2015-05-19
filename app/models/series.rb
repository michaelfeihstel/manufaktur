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
  has_many :comments, as: :commentable
  has_many :series_steps, dependent: :destroy
  has_many :series_step_entries, through: :series_steps

  accepts_nested_attributes_for :series_steps, allow_destroy: true

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
      product.size_set.g1 => g1,
      product.size_set.g1h => g1h,
      product.size_set.g2 => g2,
      product.size_set.g2h => g2h,
      product.size_set.g3 => g3,
      product.size_set.g3h => g3h,
      product.size_set.g4 => g4,
      product.size_set.g4h => g4h,
      product.size_set.g5 => g5,
      product.size_set.g5h => g5h,
      product.size_set.g6 => g6,
      product.size_set.g6h => g6h,
      product.size_set.g7 => g7,
      product.size_set.g7h => g7h,
      product.size_set.g8 => g8,
      product.size_set.g8h => g8h,
      product.size_set.g9 => g9,
      product.size_set.g9h => g9h,
      product.size_set.g10 => g10,
      product.size_set.g10h => g10h,
      product.size_set.g11 => g11,
      product.size_set.g11h => g11h,
      product.size_set.g12 => g12,
      product.size_set.g12h => g12h,
      product.size_set.g13 => g13,
      product.size_set.g13h => g13h,
      product.size_set.g14 => g14,
      product.size_set.g14h => g14h,
      product.size_set.g15 => g15,
      product.size_set.g16 => g16
    }
  end

  def total_quantity
    quantities_as_array.compact.sum
  end
end
