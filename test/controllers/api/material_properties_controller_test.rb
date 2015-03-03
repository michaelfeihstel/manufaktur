require "test_helper"

class Api::MaterialPropertiesControllerTest < ActionController::TestCase

  setup do
    @material_property = material_properties(:default_material_property)
  end





  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:material_properties)
  end

  test "should show single material property" do
    get :show, format: :json, id: @material_property
    assert_response :success
    assert_not_nil assigns(:material_property)
  end

  test "should update material property" do
    patch :update, format: :json, id: @material_property, material_property: @material_property.attributes
    assert_response :success
  end

  test "should create material property" do
    assert_difference "MaterialProperty.count" do
      post :create, format: :json, material_property: {
        name: @material_property.name,
        value: @material_property.value,
        use_in_name: @material_property.use_in_name
      }
    end
  end

end