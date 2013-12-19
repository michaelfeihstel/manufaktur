# == Schema Information
#
# Table name: variation_sets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VariationSet < ActiveRecord::Base
	has_many :variations, dependent: :destroy
	accepts_nested_attributes_for :variations, :allow_destroy => true
end