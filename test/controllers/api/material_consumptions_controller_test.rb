require "test_helper"

class Api::MaterialConsumptionsControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:default_user)
    @material_consumption = material_consumptions(:default)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:material_consumptions)
  end

  test "should show material_consumption" do
    get :show, format: :json, id: @material_consumption
    assert_response :success
    assert_not_nil assigns(:material_consumption)
  end

  test "should update material_consumption" do
    patch :update, format: :json, id: @material_consumption, material_consumption: @material_consumption.attributes
    assert_response :success
  end

  test "should create material_consumption" do
    post :create, format: :json, material_consumption: {
      product_id: @material_consumption.product_id,
      material_id: @material_consumption.material_id,
      yield_per_unit: @material_consumption.yield_per_unit
    }
  end

end