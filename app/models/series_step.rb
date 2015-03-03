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

class SeriesStep < ActiveRecord::Base
  belongs_to :series
  belongs_to :work_step

  delegate :product, to: :series
end
