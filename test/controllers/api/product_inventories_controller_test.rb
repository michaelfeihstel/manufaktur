require "test_helper"

class Api::ProductInventoriesControllerTest < ActionController::TestCase
  setup do
    @product_inventory = product_inventories(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get single product_inventory" do
    get :show, format: :json, id: @product_inventory
    assert_response :success
  end

  test "should create product_inventory" do
    assert_difference "ProductInventory.count" do
      post :create, format: :json, product_inventory: { 
        name: @product_inventory.name,
        year: @product_inventory.year
      }
    end
  end

  test "should update product_inventory" do
    patch :update, format: :json, id: @product_inventory, product_inventory: { 
      year: @product_inventory.year
    }
  end
end