# == Schema Information
#
# Table name: defects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Defect < ActiveRecord::Base
end
