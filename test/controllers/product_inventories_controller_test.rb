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

class ProductInventoriesControllerTest < ActionController::TestCase

  setup do
    @product_inventory = product_inventories(:default)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show single inventory" do
    get :show, params: { id: @product_inventory }
    assert_response :success
  end

end
