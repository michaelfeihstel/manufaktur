require "test_helper"

class Api::SeriesStepsControllerTest < ActionController::TestCase
  setup do
    @series_step = series_steps(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get single series_step" do
    get :show, format: :json, params: { id: @series_step }
    assert_response :success
  end

  test "should create new series_step" do
    assert_difference "SeriesStep.count" do
      post :create, format: :json, params: {
        series_step: {
          series_id: @series_step.series_id,
          work_step_id: @series_step.work_step_id,
          comment: @series_step.comment
        }
      }
    end
    assert_response :success
  end

  test "should update series_step" do
    patch :update, format: :json, params: {
      id: @series_step,
      series_step: @series_step.attributes
    }
    assert_response :success
  end
end