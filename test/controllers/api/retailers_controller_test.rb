require "test_helper"

class Api::RetailersControllerTest < ActionController::TestCase
  setup do
    @retailer = retailers(:default)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:retailers)
  end

  test "should show single retailer" do
    get :show, format: :json, id: @retailer
    assert_response :success
    assert_not_nil assigns(:retailer)
  end

  test "should update retailer" do
    patch :update, format: :json, id: @retailer, retailer: @retailer.attributes
    assert_response :success
  end

  test "shoudl create new retailer" do
    assert_difference "Retailer.count", 1 do
      post :create, format: :json, retailer: {
        allow_orders: @retailer.allow_orders
      }
    end
  end
end