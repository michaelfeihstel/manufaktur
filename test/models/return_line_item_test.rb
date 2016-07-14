# == Schema Information
#
# Table name: return_line_items
#
#  id         :integer          not null, primary key
#  return_id  :integer
#  product_id :integer
#  g1         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_return_line_items_on_product_id  (product_id)
#  index_return_line_items_on_return_id   (return_id)
#

require "test_helper"

class ReturnLineItemTest < ActiveSupport::TestCase

  def return_line_item
    @return_line_item ||= ReturnLineItem.new
  end

  def test_valid
    assert return_line_item.valid?
  end

end
