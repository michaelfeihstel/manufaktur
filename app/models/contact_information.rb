# == Schema Information
#
# Table name: contact_informations
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  name       :string(255)
#  value      :string(255)
#  info_type  :string(255)
#  default    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_contact_informations_on_contact_id  (contact_id)
#  index_contact_informations_on_info_type   (info_type)
#  index_contact_informations_on_value       (value)
#

class ContactInformation < ActiveRecord::Base
  belongs_to :contact

  scope :phone, -> { where(info_type: "Telefon") }
  scope :email, -> { where(info_type: "E-Mail") }
  scope :fax, -> { where(info_type: "Fax") }
  scope :people, -> { where(info_type: "Person") }
  scope :other, -> { where(info_type: "Andere") }
end
