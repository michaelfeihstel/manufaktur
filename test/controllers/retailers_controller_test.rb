require "test_helper"

class RetailersControllerTest < ActionController::TestCase

  setup do
    @user = users(:default_user)
    @retailer = retailers(:default_retailer)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retailers)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:retailer).new_record?
  end
  
  test "should create new retailer" do
    assert_difference "Retailer.count" do
      post :create, retailer: @retailer.attributes
    end
    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should get edit" do
    get :edit, id: @retailer.id
    assert :success
  end

  test "should update retailer" do
    patch :update, id: @retailer, retailer: @retailer.attributes
    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should delete retailer" do
    assert_difference "Retailer.count", -1 do
      delete :destroy, id: @retailer
    end
    assert_redirected_to retailers_path
  end

end