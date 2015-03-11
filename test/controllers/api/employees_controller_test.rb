require "test_helper"

class Api::EmployeesControllerTest < ActionController::TestCase

  setup do
    @employee = employees(:default)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should show single employee" do
    get :show, format: :json, id: @employee
    assert_response :success
    assert_not_nil assigns(:employee)
  end

  test "should update employee" do
    patch :update, format: :json, id: @employee, employee: @employee.attributes
    assert_response :success
  end

  test "should create new employee" do
    assert_difference "Employee.count" do
      post :create, format: :json, employee: {
        active: true
      }
    end
    assert_response :success
  end

end