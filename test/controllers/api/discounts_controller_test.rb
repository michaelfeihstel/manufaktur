require "test_helper"

class Api::DiscountsControllerTest < ActionController::TestCase
  setup do
    @discount = discounts(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show single discount" do
    get :show, format: :json, params: { id: @discount }
    assert_response :success
  end

  test "should create discount" do
    assert_difference "Discount.count" do
      post :create, format: :json, params: {
        discount: {
          line_item_id: @discount.line_item_id,
          name: @discount.name,
          discount: @discount.discount
        }
      }
    end
  end

  test "should update discount" do
    patch :update, format: :json, params: { id: @discount, discount: @discount.attributes }
    assert_response :success
  end
end