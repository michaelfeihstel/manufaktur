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
  has_many :series_step_entries, dependent: :destroy

  accepts_nested_attributes_for :series_step_entries, allow_destroy: true

  delegate :product, to: :series
  delegate :name, to: :series
end