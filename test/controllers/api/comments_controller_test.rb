require "test_helper"

class Api::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get single comment" do
    get :show, format: :json, id: @comment
    assert_response :success
  end

  test "should create comment" do
    assert_difference "Comment.count" do
      post :create, format: :json, comment: {
        text: @comment.text,
        user_id: @comment.user_id,
        commentable_id: @comment.commentable_id,
        commentable_type: @comment.commentable_type
      }
    end
    assert_response :success
  end

  test "should update comment" do
    patch :update, format: :json, id: @comment, comment: {
      text: @comment.text
    }
    assert_response :success
  end

  test "should delete comment" do
    assert_difference "Comment.count", -1 do
      delete :destroy, format: :json, id: @comment
    end
    assert_response :success
  end
end