# == Schema Information
#
# Table name: series_step_entries
#
#  id             :integer          not null, primary key
#  series_step_id :integer
#  date           :date
#  b_stock        :boolean          default(FALSE)
#  g1             :integer
#  g1h            :integer
#  g2             :integer
#  g2h            :integer
#  g3             :integer
#  g3h            :integer
#  g4             :integer
#  g4h            :integer
#  g5             :integer
#  g5h            :integer
#  g6             :integer
#  g6h            :integer
#  g7             :integer
#  g7h            :integer
#  g8             :integer
#  g8h            :integer
#  g9             :integer
#  g9h            :integer
#  g10            :integer
#  g10h           :integer
#  g11            :integer
#  g11h           :integer
#  g12            :integer
#  g12h           :integer
#  g13            :integer
#  g13h           :integer
#  g14            :integer
#  g14h           :integer
#  g15            :integer
#  g16            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  contact_id     :integer
#  final_step     :boolean          default(FALSE)
#
# Indexes
#
#  index_series_step_entries_on_contact_id      (contact_id)
#  index_series_step_entries_on_date            (date)
#  index_series_step_entries_on_final_step      (final_step)
#  index_series_step_entries_on_series_step_id  (series_step_id)
#

class SeriesStepEntry < ActiveRecord::Base
  # associations
  belongs_to :series_step
  belongs_to :contact
  
  # scopes
  scope :sized, -> (size) { where("? > 0", size) }
  scope :final, -> { where(final_step: true) }
  scope :completed_since, -> (date) { where("date >= ? AND final_step = ?", date, true) }





  # methods
  def total
    sizes_as_array.compact.sum
  end

  def sizes_as_array
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

  def sizes_as_hash
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
  
end
