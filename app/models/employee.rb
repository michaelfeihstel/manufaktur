# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  # associations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :contact_information, as: :contactable, dependent: :destroy
  has_many :orders, as: :customer
  has_many :letters, through: :addresses
  has_many :line_items, through: :orders

  accepts_nested_attributes_for :addresses, allow_destroy: true






end
