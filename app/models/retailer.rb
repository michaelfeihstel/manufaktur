# == Schema Information
#
# Table name: retailers
#
#  id           :integer          not null, primary key
#  contact_id   :integer
#  allow_orders :boolean          default("true")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Retailer < ActiveRecord::Base
  has_one :contact, as: :contact_role
end
