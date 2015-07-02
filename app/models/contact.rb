# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  fmid            :integer
#  created_at      :datetime
#  updated_at      :datetime
#  contact_role_id :integer
#  additional_data :hstore
#
# Indexes
#
#  index_contacts_on_additional_data  (additional_data)
#  index_contacts_on_contact_role_id  (contact_role_id)
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
  has_many :materials, dependent: :nullify
  has_many :orders
  has_many :phones, -> { where(info_type: "Telefon") }, class_name: "ContactInformation"
  has_many :product_inventory_items, dependent: :nullify
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
  scope :filter, -> (type) { joins(:contact_role).where(contact_roles: { name: type }) }
  scope :best_in_period, -> (from, to) { joins(:line_items).select("contacts.*, SUM((COALESCE(g1, 0) + COALESCE(g1h, 0) + COALESCE(g2, 0) + COALESCE(g2h, 0) + COALESCE(g3, 0) + COALESCE(g3h, 0) + COALESCE(g4, 0) + COALESCE(g4h, 0) + COALESCE(g5, 0) + COALESCE(g5h, 0) + COALESCE(g6, 0) + COALESCE(g6h, 0) + COALESCE(g7, 0) + COALESCE(g7h, 0) + COALESCE(g8, 0) + COALESCE(g8h, 0) + COALESCE(g9, 0) + COALESCE(g9h, 0) + COALESCE(g10, 0) + COALESCE(g10h, 0) + COALESCE(g11, 0) + COALESCE(g11h, 0) + COALESCE(g12, 0) + COALESCE(g12h, 0) + COALESCE(g13, 0) + COALESCE(g13h, 0) + COALESCE(g14, 0) + COALESCE(g14h, 0) + COALESCE(g15, 0) + COALESCE(g16, 0)) * price) AS total").where("orders.completed_at BETWEEN ? AND ?", from, to).group("contacts.id").order("total DESC") }

  # pg_search
  include PgSearch
  multisearchable against: [:name, :billing_address]

  # methods
  def billing_address
    self.addresses.first.try(:full_address)
  end

  def employee?
    self.try(:contact_role).try(:name) == "Mitarbeiter"
  end

  def retailer?
    self.try(:contact_role).try(:name) == "Retailer"
  end

  def supplier?
    self.try(:contact_role).try(:name) == "Supplier"
  end

end
