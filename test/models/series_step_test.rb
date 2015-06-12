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

require "test_helper"

class SeriesStepTest < ActiveSupport::TestCase

  def series_step
    @series_step ||= SeriesStep.new
  end

  def test_valid
    assert series_step.valid?
  end

end
