# == Schema Information
#
# Table name: contact_informations
#
#  id               :integer          not null, primary key
#  contactable_id   :integer
#  name             :string(255)
#  value            :string(255)
#  info_type        :string(255)
#  default          :boolean          default("false")
#  created_at       :datetime
#  updated_at       :datetime
#  contactable_type :string
#

class ContactInformation < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true

  scope :phone, -> { where(info_type: "Telefon") }
  scope :email, -> { where(info_type: "E-Mail") }
  scope :fax, -> { where(info_type: "Fax") }
  scope :people, -> { where(info_type: "Person") }
  scope :other, -> { where(info_type: "Andere") }
end
