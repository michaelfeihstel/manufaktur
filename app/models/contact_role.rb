# == Schema Information
#
# Table name: contact_roles
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  human_readable_name :string
#

class ContactRole < ApplicationRecord
  has_many :contacts
end
