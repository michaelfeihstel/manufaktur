# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  logo       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ActiveRecord::Base
  attr_accessible :name, :logo
end
