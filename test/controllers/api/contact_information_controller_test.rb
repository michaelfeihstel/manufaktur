require "test_helper"

class Api::ContactInformationControllerTest < ActionController::TestCase
  setup do
    @contact_information = contact_information(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show contact_information" do
    get :show, format: :json, params: { id: @contact_information }
    assert_response :success
  end

  test "should create contact_information" do
    assert_difference "ContactInformation.count" do
      post :create, format: :json, params: {
        contact_information: {
          name: @contact_information.name,
          value: @contact_information.value
        }
      }
    end
    assert_response :success
  end

  test "should update contact_information" do
    patch :update, format: :json, params: {
      id: @contact_information,
      contact_information: @contact_information.attributes
    }
    assert_response :success
  end
end