# == Schema Information
#
# Table name: product_inventory_items
#
#  id                   :integer          not null, primary key
#  product_inventory_id :integer
#  product_id           :integer
#  contact_id           :integer
#  entered_on           :date
#  g1                   :integer
#  g1h                  :integer
#  g2                   :integer
#  g2h                  :integer
#  g3                   :integer
#  g3h                  :integer
#  g4                   :integer
#  g4h                  :integer
#  g5                   :integer
#  g5h                  :integer
#  g6                   :integer
#  g6h                  :integer
#  g7                   :integer
#  g7h                  :integer
#  g8                   :integer
#  g8h                  :integer
#  g9                   :integer
#  g9h                  :integer
#  g10                  :integer
#  g10h                 :integer
#  g11                  :integer
#  g11h                 :integer
#  g12                  :integer
#  g12h                 :integer
#  g13                  :integer
#  g13h                 :integer
#  g14                  :integer
#  g14h                 :integer
#  g15                  :integer
#  g16                  :integer
#  value                :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require "test_helper"

class ProductInventoryItemTest < ActiveSupport::TestCase

  def product_inventory_item
    @product_inventory_item ||= ProductInventoryItem.new
  end

  def test_valid
    assert product_inventory_item.valid?
  end

end
