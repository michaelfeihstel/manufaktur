# == Schema Information
#
# Table name: shipments
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  tracking_code :string
#  weight        :integer
#  carrier_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class ShipmentTest < ActiveSupport::TestCase

  def shipment
    @shipment ||= Shipment.new
  end

  def test_valid
    assert shipment.valid?
  end

end
