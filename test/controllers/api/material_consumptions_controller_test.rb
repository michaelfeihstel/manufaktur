require "test_helper"

class Api::MaterialConsumptionsControllerTest < ActionController::TestCase
  
  setup do
    @material_consumption = material_consumptions(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show material_consumption" do
    get :show, format: :json, params: { id: @material_consumption }
    assert_response :success
  end

  test "should create material_consumption" do
    post :create, format: :json, params: {
      material_consumption: {
        product_id: @material_consumption.product_id,
        material_id: @material_consumption.material_id,
        yield_per_unit: @material_consumption.yield_per_unit
      }
    }
    assert_response :success
  end

  test "should update material_consumption" do
    patch :update, format: :json, params: { id: @material_consumption, material_consumption: @material_consumption.attributes }
    assert_response :success
  end

end