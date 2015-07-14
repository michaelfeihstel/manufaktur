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
# Indexes
#
#  index_shipments_on_carrier_id  (carrier_id)
#  index_shipments_on_order_id    (order_id)
#

class Shipment < ActiveRecord::Base
  belongs_to :order
  belongs_to :carrier

  # methods
  def tracking_link
    carrier.tracking_link.gsub("###TRACKING_CODE###", tracking_code)
  end
end