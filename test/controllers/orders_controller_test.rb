require "test_helper"

class OrdersControllerTest < ActionController::TestCase

  setup do
    @order = orders(:default_order)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:order).new_record?
  end

  test "should create new order" do
    assert_difference("Order.count") do
      post :create, order: {
        billing_address_id: @order.billing_address,
        delivery_address_id: @order.delivery_address
      }
    end
    assert_redirected_to order_path(assigns(:order))
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference "Order.count", -1 do
      delete :destroy, id: @order
    end
  end

end