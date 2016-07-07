require "test_helper"

class Api::ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show shipment" do
    get :show, format: :json, params: { id: @shipment }
    assert_response :success
  end

  test "should create shipment" do
    assert_difference "Shipment.count" do
      post :create, format: :json, params: { 
        shipment: {
          order_id: @shipment.order_id,
          carrier_id: @shipment.carrier_id,
          tracking_code: @shipment.tracking_code
        }
      }
    end
    assert_response :success
  end

  test "should update shipment" do
    patch :update, format: :json, params: {
      id: @shipment,
      shipment: @shipment.attributes
    }
    assert_response :success
  end
end