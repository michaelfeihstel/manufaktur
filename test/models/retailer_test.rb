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

require "test_helper"

class RetailerTest < ActiveSupport::TestCase

  def retailer
    @retailer ||= Retailer.new
  end

  def test_valid
    assert retailer.valid?
  end

end
