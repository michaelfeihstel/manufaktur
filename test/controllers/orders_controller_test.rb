# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  delivered_on          :date
#  invoiced_at           :datetime
#  completed_at          :datetime
#  contact_id            :integer
#  billing_address_id    :integer
#  delivery_address_id   :integer
#  billing_name          :string(255)
#  billing_street        :string(255)
#  billing_house_number  :string(255)
#  billing_zip           :string(255)
#  billing_city          :string(255)
#  billing_country       :string(255)
#  delivery_name         :string(255)
#  delivery_street       :string(255)
#  delivery_house_number :string(255)
#  delivery_city         :string(255)
#  delivery_zip          :string(255)
#  delivery_country      :string(255)
#  delivery_iso          :string(255)
#  is_webshop            :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  marked                :boolean          default(FALSE), not null
#  fmid                  :integer
#  comment               :text
#  is_free               :boolean          default(FALSE)
#  is_vat_exempt         :boolean          default(FALSE)
#  paid_on               :date
#  paid_amount           :decimal(8, 2)
#  is_scheduled_delivery :boolean          default(FALSE)
#  cashback_until        :date
#  cashback_percent      :decimal(2, 2)    default(0.03)
#  tax_id                :integer
#

require "test_helper"

class OrdersControllerTest < ActionController::TestCase

  setup do
    @user = users(:default_user)
    @order = orders(:default_order)
    sign_in @user
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
