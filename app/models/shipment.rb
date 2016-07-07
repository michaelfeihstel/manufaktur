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

class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :carrier

  # methods
  def tracking_link
    carrier&.tracking_link&.gsub("###TRACKING_CODE###", tracking_code)
  end
end
