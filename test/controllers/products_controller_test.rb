# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  sku               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  price             :decimal(8, 2)
#  vat               :decimal(, )
#  color_text        :string(255)
#  variation_set_id  :integer
#  fmid              :integer
#  primary_color     :string(255)
#  secondary_color   :string(255)
#  text_color        :string(255)      default("#fff")
#  size_set_id       :integer
#  product_family    :string
#  retail_price      :decimal(8, 2)
#  product_family_id :integer
#

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  
  setup do
    @product = products(:default_product)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should show product" do
    get :show, params: { id: @product }
    assert_response :success
    assert_not_nil assigns(:product)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:product).new_record?
  end

  test "should create product" do
    assert_difference("Product.count") do
      post :create, params: { product: @product.attributes }
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should get edit" do
    get :edit, params: { id: @product }
    assert_response :success
  end

  test "should update product attributes" do
    patch :update, params: { id: @product, product: @product.attributes }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete :destroy, params: { id: @product }
    end
    assert_redirected_to products_path
  end

end
