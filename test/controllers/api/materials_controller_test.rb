require "test_helper"

class Api::MaterialsControllerTest < ActionController::TestCase

  setup do
    @material = materials(:default_material)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show material" do
    get :show, format: :json, id: @material
    assert_response :success
  end

  test "should update material" do
    patch :update, format: :json, id: @material, material: @material.attributes
    assert_response :success
  end

  test "should create material" do
    assert_difference "Material.count" do
      post :create, format: :json, material: {
        name: @material.name,
        unit: @material.unit
      }
    end
    assert_response :success
  end

end