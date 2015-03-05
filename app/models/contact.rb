# == Schema Information
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  fmid             :integer
#  created_at       :datetime
#  updated_at       :datetime
#  contactable_type :string
#

class Contact < ActiveRecord::Base
  # associations
  has_one :employee, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :contact_information, dependent: :destroy
  has_many :emails, -> { where(info_type: "E-Mail") }, class_name: "ContactInformation"
  has_many :phones, -> { where(info_type: "Telefon") }, class_name: "ContactInformation"
  has_many :orders
  has_many :line_items, through: :orders
  has_many :letters, through: :addresses

  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contact_information, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates :name, presence: true

  def billing_address
    self.addresses.first.full_address
  end

end
