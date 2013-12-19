# == Schema Information
#
# Table name: variations
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  variation_set_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Variation < ActiveRecord::Base
	belongs_to :variation_set
end
