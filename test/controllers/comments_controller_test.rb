require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:default)
    @user = users(:default_user)

    sign_in @user
  end
end