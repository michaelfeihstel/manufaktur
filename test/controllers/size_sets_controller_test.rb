require "test_helper"

class SizeSetsControllerTest < ActionController::TestCase

  setup do
    @size_set = size_sets(:default)
    @user =  users(:default_user)

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:size_sets)
  end

  test "should show single size_set" do
    get :show, id: @size_set
    assert_response :success
    assert_not_nil assigns(:size_set)
  end

  test "should get edit page for size_set" do
    get :edit, id: @size_set
    assert_response :success
    assert_not_nil assigns(:size_set)
  end

  test "should update size_set" do
    patch :update, id: @size_set, size_set: @size_set.attributes
    assert_redirected_to assigns(:size_set)
  end

  test "should create size_set" do
    post :create, size_set: {
      name: @size_set.name,
      g1: @size_set.g1
    }
  end

end