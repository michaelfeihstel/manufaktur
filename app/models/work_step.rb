# == Schema Information
#
# Table name: work_steps
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  final_step :boolean          default(FALSE)
#

class WorkStep < ActiveRecord::Base
  # associations
  has_many :series_steps, dependent: :destroy
end
