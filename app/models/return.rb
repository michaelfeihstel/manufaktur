# == Schema Information
#
# Table name: returns
#
#  id                 :integer          not null, primary key
#  contact_id         :integer
#  billing_address_id :integer
#  comment            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Return < ApplicationRecord
  belongs_to :contact
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: "Address"
end
