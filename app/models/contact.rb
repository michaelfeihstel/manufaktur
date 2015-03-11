# == Schema Information
#
# Table name: contacts
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  fmid              :integer
#  created_at        :datetime
#  updated_at        :datetime
#  contact_role_id   :integer
#  contact_role_type :string
#

class Contact < ActiveRecord::Base
  # associations
  belongs_to :contact_role, polymorphic: true
  has_many :addresses, dependent: :destroy
  has_many :contact_information, dependent: :destroy
  has_many :emails, -> { where(info_type: "E-Mail") }, class_name: "ContactInformation"
  has_many :phones, -> { where(info_type: "Telefon") }, class_name: "ContactInformation"
  has_many :orders
  has_many :line_items, through: :orders
  has_many :letters, through: :addresses

  accepts_nested_attributes_for :contact_role
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contact_information, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates :name, presence: true

  # methods
  def billing_address
    self.addresses.first.full_address
  end

  def employee?
    contact_role_type == "Employee"
  end

end
