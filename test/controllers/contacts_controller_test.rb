require "test_helper"

class ContactsControllerTest < ActionController::TestCase

  setup do
    @contact = contacts(:default_contact)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:contact).new_record?
  end

  test "should create new contact" do
    assert_difference "Contact.count", +1 do
      post :create, contact: @contact.attributes
    end
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should get edit" do
    get :edit, id: @contact.id
    assert :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: @contact.attributes
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should delete contact" do
    assert_difference "Contact.count", -1 do
      delete :destroy, id: @contact
    end
    assert_redirected_to contacts_path
  end

end