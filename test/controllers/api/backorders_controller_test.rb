require "test_helper"

class Api::BackordersControllerTest < ActionController::TestCase
  setup do
    @backorder = backorders(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show backorder" do
    get :show, format: :json, params: { id: @backorder }
    assert_response :success
  end

  test "should create backorder" do
    assert_difference "Backorder.count" do
      post :create, format: :json, params: {
        backorder: {
          order_id: @backorder.order_id,
          product_id: @backorder.product_id,
          g10: 2
        }
      }
    end
    assert_response :success
  end

  test "should update backorder" do
    patch :update, format: :json, params: { id: @backorder, backorder: @backorder.attributes }
    assert_response :success
  end

  test "should delete backorder" do
    assert_difference "Backorder.count", -1 do
      delete :destroy, foramt: :json, params: { id: @backorder }
    end
    assert_response :success
  end

  test "should destroy all backorders for an order" do
    assert_difference "Backorder.count", -1 do
      delete :destroy_by_order, format: :json, params: { order_id: @backorder.order_id }
    end
    assert_response :success
  end
end