require "test_helper"

class Api::SeriesStepsControllerTest < ActionController::TestCase

  setup do
    @series_step = series_steps(:default)
    @user = users(:default_user)
    sign_in @user
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:series_steps)
  end

  test "should get single series_step" do
    get :show, format: :json, id: @series_step
    assert_response :success
    assert_not_nil assigns(:series_step)
  end

  test "should create new series_step" do
    assert_difference "SeriesStep.count" do
      post :create, format: :json, series_step: {
        series_id: @series_step.series_id,
        work_step_id: @series_step.work_step_id,
        comment: @series_step.comment
      }
    end
  end

  test "should update series_step" do
    patch :update, format: :json, id: @series_step, series_step: @series_step.attributes
    assert_response :success
  end

end