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
#  additional_data   :hstore
#

class Contact < ActiveRecord::Base
  store_accessor :additional_data, :test

  # associations
  belongs_to :contact_role
  has_many :addresses, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :contact_information, dependent: :destroy
  has_many :emails, -> { where(info_type: "E-Mail") }, class_name: "ContactInformation"
  has_many :letters, through: :addresses
  has_many :line_items, through: :orders
  has_many :orders
  has_many :phones, -> { where(info_type: "Telefon") }, class_name: "ContactInformation"
  has_many :series_step_entries, dependent: :destroy

  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :contact_role
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contact_information, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true

  # validations
  validates :name, presence: true

  # scopes
  scope :employees, -> { where(contact_role_type: "Employee") }
  scope :retailers, -> { where(contact_role_type: "Retailer") }

  # methods
  def billing_address
    self.addresses.first.full_address
  end

  def employee?
    self.try(:contact_role).try(:name) == "Mitarbeiter"
  end

  def retailer?
    self.try(:contact_role).try(:name) == "Retailer"
  end

end
