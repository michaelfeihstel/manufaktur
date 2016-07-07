require "test_helper"

class Api::LettersControllerTest < ActionController::TestCase
  setup do
    @letter = letters(:default_letter)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show letter" do
    get :show, format: :json, params: { id: @letter }
    assert_response :success
  end

  test "should create letter" do
    assert_difference "Letter.count" do
      post :create, format: :json, params: {
        letter: {
          subject: @letter.subject,
          body: @letter.body
        }
      }
    end
  end

  test "should update letter" do
    patch :update, format: :json, params: { id: @letter, letter: @letter.attributes }
    assert_response :success
  end
end