require "test_helper"

class ProductFamilyControllerTest < ActionController::TestCase

  setup  do
    @product_family = product_families(:default)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end