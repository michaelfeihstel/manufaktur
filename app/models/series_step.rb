# == Schema Information
#
# Table name: series_steps
#
#  id           :integer          not null, primary key
#  series_id    :integer
#  work_step_id :integer
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_series_steps_on_series_id     (series_id)
#  index_series_steps_on_work_step_id  (work_step_id)
#

class SeriesStep < ActiveRecord::Base

  # associations
  belongs_to :series
  belongs_to :work_step
  has_many :entries, dependent: :destroy, class_name: "SeriesStepEntry"

  accepts_nested_attributes_for :entries, allow_destroy: true

  delegate :product, to: :series
  delegate :name, to: :series
  
  # Scopes


  # methods
  def total(size: nil)
    if size
      self.entries.sum(size.to_sym)
    else
      self.entries.to_a.sum(&:total)
    end
  end

  def remaining_quantity
    SeriesStep.joins(:entries, :series)
      .where(id: id)
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
