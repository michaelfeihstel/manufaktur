require "test_helper"

class Api::ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:default_contact)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should show contact" do
    get :show, format: :json, id: @contact
    assert_response :success
    assert_not_nil assigns(:contact)
  end

  test "should create contact" do
    assert_difference "Contact.count" do
      post :create, format: :json, contact: { name: @contact.name }
    end
  end

  test "should edit contact" do
    patch :update, format: :json, id: @contact, contact: { name: @contact.name }
  end
end