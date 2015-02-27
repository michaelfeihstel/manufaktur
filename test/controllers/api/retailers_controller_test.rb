require "test_helper"

class Api::RetailersControllerTest < ActionController::TestCase
  setup do
    @retailer = retailers(:default_retailer)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:retailers)
  end

  test "should show retailer" do
    get :show, format: :json, id: @retailer
    assert_response :success
    assert_not_nil assigns(:retailer)
  end

  test "should create retailer" do
    assert_difference "Retailer.count" do
      post :create, format: :json, retailer: { name: @retailer.name }
    end
  end

  test "should edit retailer" do
    patch :update, format: :json, id: @retailer, retailer: { name: @retailer.name }
  end
end