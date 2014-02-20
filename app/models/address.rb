# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  contact_id   :integer
#  name         :string(255)
#  street       :string(255)
#  house_number :string(255)
#  zip          :string(255)
#  city         :string(255)
#  country      :string(255)
#

class Address < ActiveRecord::Base
  
  belongs_to :contact



  def full_address(hide_name)
  	(hide_name == 1 ? "" : self.name + " / ") + self.street + " " + self.house_number + " / " + self.zip + " " + self.city + " / " + self.country
  end
  
end
