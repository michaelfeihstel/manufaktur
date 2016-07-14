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
# Indexes
#
#  index_series_on_product_id  (product_id)
#

class Series < ApplicationRecord
  # associations
  belongs_to :product
  has_many :comments, as: :commentable
  has_many :series_steps, dependent: :destroy
  has_many :entries, through: :series_steps, class_name: "SeriesStepEntry"

  accepts_nested_attributes_for :series_steps, allow_destroy: true

  # pg_search
  include PgSearch
  multisearchable against: [:name]

  # scopes
  scope :newest, -> { order(name: :desc) }
  scope :scheduled_since, -> (date) { where("finished_on >= ?", date) }

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

  def total_quantity_per_size
    product.size_set.sizes_as_hash.map do |k, v|
      entries.sum(k.to_sym)
    end
  end

  def finished_quantity
    entries.final.pluck("SUM(COALESCE(g1, 0)) as g1,
      SUM(COALESCE(g1h, 0)) as g1h,
      SUM(COALESCE(g2, 0)) as g2,
      SUM(COALESCE(g2h, 0)) as g2h,
      SUM(COALESCE(g3, 0)) as g3,
      SUM(COALESCE(g3h, 0)) as g3h,
      SUM(COALESCE(g4, 0)) as g4,
      SUM(COALESCE(g4h, 0)) as g4h,
      SUM(COALESCE(g5, 0)) as g5,
      SUM(COALESCE(g5h, 0)) as g5h,
      SUM(COALESCE(g6, 0)) as g6,
      SUM(COALESCE(g6h, 0)) as g6h,
      SUM(COALESCE(g7, 0)) as g7,
      SUM(COALESCE(g7h, 0)) as g7h,
      SUM(COALESCE(g8, 0)) as g8,
      SUM(COALESCE(g8h, 0)) as g8h,
      SUM(COALESCE(g9, 0)) as g9,
      SUM(COALESCE(g9h, 0)) as g9h,
      SUM(COALESCE(g10, 0)) as g10,
      SUM(COALESCE(g10h, 0)) as g10h,
      SUM(COALESCE(g11, 0)) as g11,
      SUM(COALESCE(g11h, 0)) as g11h,
      SUM(COALESCE(g12, 0)) as g12,
      SUM(COALESCE(g12h, 0)) as g12h,
      SUM(COALESCE(g13, 0)) as g13,
      SUM(COALESCE(g13h, 0)) as g13h,
      SUM(COALESCE(g14, 0)) as g14,
      SUM(COALESCE(g14h, 0)) as g14h,
      SUM(COALESCE(g15, 0)) as g15,
      SUM(COALESCE(g16, 0)) as g16")
      .flatten
  end

  def remaining_quantity
    Series.joins(:entries)
      .where(id: id, series_step_entries: { final_step: true })
      .pluck("MAX(COALESCE(series.g1, 0)) - SUM(COALESCE(series_step_entries.g1, 0)),
      MAX(COALESCE(series.g1h, 0)) - SUM(COALESCE(series_step_entries.g1h, 0)),
      MAX(COALESCE(series.g2, 0)) - SUM(COALESCE(series_step_entries.g2, 0)),
      MAX(COALESCE(series.g2h, 0)) - SUM(COALESCE(series_step_entries.g2h, 0)),
      MAX(COALESCE(series.g3, 0)) - SUM(COALESCE(series_step_entries.g3, 0)),
      MAX(COALESCE(series.g3h, 0)) - SUM(COALESCE(series_step_entries.g3h, 0)),
      MAX(COALESCE(series.g4, 0)) - SUM(COALESCE(series_step_entries.g4, 0)),
      MAX(COALESCE(series.g4h, 0)) - SUM(COALESCE(series_step_entries.g4h, 0)),
      MAX(COALESCE(series.g5, 0)) - SUM(COALESCE(series_step_entries.g5, 0)),
      MAX(COALESCE(series.g5h, 0)) - SUM(COALESCE(series_step_entries.g5h, 0)),
      MAX(COALESCE(series.g6, 0)) - SUM(COALESCE(series_step_entries.g6, 0)),
      MAX(COALESCE(series.g6h, 0)) - SUM(COALESCE(series_step_entries.g6h, 0)),
      MAX(COALESCE(series.g7, 0)) - SUM(COALESCE(series_step_entries.g7, 0)),
      MAX(COALESCE(series.g7h, 0)) - SUM(COALESCE(series_step_entries.g7h, 0)),
      MAX(COALESCE(series.g8, 0)) - SUM(COALESCE(series_step_entries.g8, 0)),
      MAX(COALESCE(series.g8h, 0)) - SUM(COALESCE(series_step_entries.g8h, 0)),
      MAX(COALESCE(series.g9, 0)) - SUM(COALESCE(series_step_entries.g9, 0)),
      MAX(COALESCE(series.g9h, 0)) - SUM(COALESCE(series_step_entries.g9h, 0)),
      MAX(COALESCE(series.g10, 0)) - SUM(COALESCE(series_step_entries.g10, 0)),
      MAX(COALESCE(series.g10h, 0)) - SUM(COALESCE(series_step_entries.g10h, 0)),
      MAX(COALESCE(series.g11, 0)) - SUM(COALESCE(series_step_entries.g11, 0)),
      MAX(COALESCE(series.g11h, 0)) - SUM(COALESCE(series_step_entries.g11h, 0)),
      MAX(COALESCE(series.g12, 0)) - SUM(COALESCE(series_step_entries.g12, 0)),
      MAX(COALESCE(series.g12h, 0)) - SUM(COALESCE(series_step_entries.g12h, 0)),
      MAX(COALESCE(series.g13, 0)) - SUM(COALESCE(series_step_entries.g13, 0)),
      MAX(COALESCE(series.g13h, 0)) - SUM(COALESCE(series_step_entries.g13h, 0)),
      MAX(COALESCE(series.g14, 0)) - SUM(COALESCE(series_step_entries.g14, 0)),
      MAX(COALESCE(series.g14h, 0)) - SUM(COALESCE(series_step_entries.g14h, 0)),
      MAX(COALESCE(series.g15, 0)) - SUM(COALESCE(series_step_entries.g15, 0)),
      MAX(COALESCE(series.g16, 0)) - SUM(COALESCE(series_step_entries.g16, 0))")
      .flatten
  end

end
