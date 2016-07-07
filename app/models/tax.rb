# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  name       :string
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tax < ApplicationRecord
  has_many :orders, dependent: :nullify 
end
