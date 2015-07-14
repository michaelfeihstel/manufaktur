# == Schema Information
#
# Table name: carriers
#
#  id            :integer          not null, primary key
#  name          :string
#  tracking_link :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class CarrierTest < ActiveSupport::TestCase

  def carrier
    @carrier ||= Carrier.new
  end

  def test_valid
    assert carrier.valid?
  end

end
