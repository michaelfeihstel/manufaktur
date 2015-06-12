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
# Indexes
#
#  index_returns_on_billing_address_id  (billing_address_id)
#  index_returns_on_contact_id          (contact_id)
#

class Return < ActiveRecord::Base
  belongs_to :contact
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: "Address"
end
