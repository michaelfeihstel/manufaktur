# == Schema Information
#
# Table name: contact_roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactRole < ActiveRecord::Base
  has_many :contacts
end
