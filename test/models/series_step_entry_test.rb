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

require "test_helper"

class SeriesStepEntryTest < ActiveSupport::TestCase

  def series_step_entry
    @series_step_entry ||= SeriesStepEntry.new
  end

  def test_valid
    assert series_step_entry.valid?
  end

end
