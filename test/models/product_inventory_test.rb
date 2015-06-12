# == Schema Information
#
# Table name: product_inventories
#
#  id         :integer          not null, primary key
#  year       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class ProductInventoryTest < ActiveSupport::TestCase

  def product_inventory
    @product_inventory ||= ProductInventory.new
  end

  def test_valid
    assert product_inventory.valid?
  end

end
