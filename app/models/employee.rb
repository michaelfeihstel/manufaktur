# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default("true")
#

class Employee < ActiveRecord::Base
  # associations
  has_one :contact, as: :contact_role
  has_many :addresses, through: :contact
  has_many :contact_information, through: :contact
  has_many :orders, through: :customer
  has_many :letters, through: :addresses
  has_many :line_items, through: :orders
  has_many :series_step_entries, dependent: :destroy

  accepts_nested_attributes_for :contact, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  delegate :name, to: :contact





  # methods
  def active_label
    if active?
      "Aktiv"
    else
      "Inaktiv"
    end
  end
end
