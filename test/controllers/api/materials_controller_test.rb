require "test_helper"

class Api::MaterialsControllerTest < ActionController::TestCase

  setup do
    @material = materials(:default_material)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show material" do
    get :show, format: :json, params: { id: @material }
    assert_response :success
  end

  test "should create material" do
    assert_difference "Material.count" do
      post :create, format: :json, params: {
        material: {
          name: @material.name,
          unit: @material.unit
        }
      }
    end
    assert_response :success
  end

  test "should update material" do
    patch :update, format: :json, params: { id: @material, material: @material.attributes }
    assert_response :success
  end

end