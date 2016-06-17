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

require "test_helper"

class DiscountsControllerTest < ActionController::TestCase
  setup do
    @discount = discounts(:default)
  end
end
