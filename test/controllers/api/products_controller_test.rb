require "test_helper"

class Api::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:default_product)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get product" do
    get :show, format: :json, params: { id: @product }
    assert_response :success
  end

  test "should create product" do
    assert_difference "Product.count" do
      post :create, format: :json, params: {
        product: {
          name: @product.name,
          sku: @product.sku
        }
      }
    end
    assert_response :success
  end

  test "should update product" do
    patch :update, format: :json, params: { id: @product, product: @product.attributes }
    assert_response :success
  end
end