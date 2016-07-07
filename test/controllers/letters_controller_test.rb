# == Schema Information
#
# Table name: letters
#
#  id           :integer          not null, primary key
#  address_id   :integer
#  name         :string(255)
#  street       :string(255)
#  house_number :string(255)
#  zip          :string(255)
#  city         :string(255)
#  country      :string(255)
#  subject      :string(255)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

require "test_helper"

class LettersControllerTest < ActionController::TestCase

  setup do
    @letter = letters(:default_letter)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letters)
  end

  test "should show letter" do
    get :show, params: { id: @letter }
    assert_response :success
    assert_not_nil assigns(:letter)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:letter).new_record?
  end

  test "should create letter" do
    assert_difference "Letter.count", +1 do
      post :create, params: { letter: @letter.attributes }
    end
    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should get edit" do
    get :edit, params: { id: @letter }
    assert_response :success
  end

  test "should update letter" do
    patch :update, params: { id: @letter, letter: @letter.attributes }
    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should delete letter" do
    assert_difference "Letter.count", -1 do
      delete :destroy, params: { id: @letter }
    end
    assert_redirected_to letters_path
  end

end
