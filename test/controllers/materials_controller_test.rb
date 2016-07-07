require "test_helper"

class MaterialsControllerTest < ActionController::TestCase

  setup do
    @material = materials(:default_material)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materials)
  end

  test "should show material" do
    get :show, params: { id: @material }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:material).new_record?
  end

  test "should create material" do
    assert_difference "Material.count" do
      post :create, params: { material: @material.attributes }
    end
    assert_redirected_to assigns(:material)
  end

  test "should get edit" do
    get :edit, params: { id: @material }
    assert_response :success
  end

  test "should update material" do
    patch :update, params: { id: @material, material: @material.attributes }
    assert_redirected_to @material
  end

  test "should delete material" do
    assert_difference "Material.count", -1 do
      delete :destroy, params: { id: @material }
    end
    assert_redirected_to materials_path
  end

end