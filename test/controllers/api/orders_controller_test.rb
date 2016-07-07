require "test_helper"

class Api::OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:default_order)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show order" do
    get :show, format: :json, params: { id: @order }
    assert_response :success
  end

  test "should create new order" do
    assert_difference "Order.count" do
      post :create, format: :json, params: { 
        order: {
          contact_id: @order.contact_id,
          tax_id: @order.tax_id
        }
      }
    end
    assert_response :success
  end

  test "should update order" do
    patch :update, format: :json, params: { id: @order, order: @order.attributes }
    assert_response :success
  end

  test "should destroy order" do
    assert_difference "Order.count", -1 do
      delete :destroy, format: :json, params: { id: @order }
    end
    assert_response :success
  end

  test "should destroy all line_items" do
    delete :destroy_line_items, format: :json, params: { id: @order }
    assert_empty @order.line_items
  end
 end