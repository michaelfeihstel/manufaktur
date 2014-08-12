require "test_helper"

class LettersControllerTest < ActionController::TestCase

  setup do
    @letter = letters(:default_letter)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letters)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:letter).new_record?
  end

  test "should create new letter" do
    assert_difference "Letter.count", +1 do
      post :create, letter: @letter.attributes
    end
    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should get edit" do
    get :edit, id: @letter
    assert_response :success
  end

  test "should update letter" do
    patch :update, id: @letter, letter: @letter.attributes
    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should delete letter" do
    assert_difference "Letter.count", -1 do
      delete :destroy, id: @letter
    end
    assert_redirected_to letters_path
  end

end