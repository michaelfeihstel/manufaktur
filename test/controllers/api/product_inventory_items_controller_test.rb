require "test_helper"

class Api::ProductInventoryItemsControllerTest < ActionController::TestCase

  setup do
    @product_inventory_item = product_inventory_items(:default)
    authenticate
  end





  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show single item" do
    get :show, format: :json, id: @product_inventory_item
    assert_response :success
  end

  test "should create new item" do
    assert_difference "ProductInventoryItem.count" do
      post :create, format: :json, product_inventory_item: {
        g1: @product_inventory_item.g1
      }
    end
  end

  test "should update item" do
    patch :update, format: :json, id: @product_inventory_item, product_inventory_item: {
      g1: @product_inventory_item.g1
    }
  end

end