# == Schema Information
#
# Table name: letters
#
#  id           :integer          not null, primary key
#  address_id   :integer
#  name         :string(255)
#  street       :string(255)
#  house_number :string(255)
#  zip          :string(255)
#  city         :string(255)
#  country      :string(255)
#  subject      :string(255)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Letter < ActiveRecord::Base
	# associations
  belongs_to :address
  has_one :contact, through: :address

  # scopes
  scope :order_by_date_desc, -> { order(created_at: :desc) }
end
