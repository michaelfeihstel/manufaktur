# == Schema Information
#
# Table name: letters
#
#  id           :integer          not null, primary key
#  contact_id   :integer
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

require 'test_helper'

class LetterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
