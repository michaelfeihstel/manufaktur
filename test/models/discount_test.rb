# == Schema Information
#
# Table name: discounts
#
#  id           :integer          not null, primary key
#  line_item_id :integer
#  name         :string
#  discount     :decimal(, )
#  enabled      :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_discounts_on_enabled       (enabled)
#  index_discounts_on_line_item_id  (line_item_id)
#

require "test_helper"

class DiscountTest < ActiveSupport::TestCase

  setup do
    @discount = discounts(:default)
    @user = users(:default_user)
    sign_in @user
  end

  def discount
    @discount ||= Discount.new
  end

  def test_valid
    assert discount.valid?
  end

end
