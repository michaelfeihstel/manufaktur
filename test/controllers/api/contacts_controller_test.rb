require "test_helper"

class Api::ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:default_contact)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should show contact" do
    get :show, format: :json, params: { id: @contact }
    assert_response :success
    assert_not_nil assigns(:contact)
  end

  test "should create contact" do
    assert_difference "Contact.count" do
      post :create, format: :json, params: {
        contact: { name: @contact.name }
      }
    end
    assert_response :success
  end

  test "should update contact" do
    patch :update, format: :json, id: @contact, params: { id: @contact, contact: @contact.attributes }
    assert_response :success
  end
end