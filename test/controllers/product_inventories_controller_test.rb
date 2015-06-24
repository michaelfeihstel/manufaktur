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
    get :show, id: @product_inventory.id
    assert_response :success
  end

end