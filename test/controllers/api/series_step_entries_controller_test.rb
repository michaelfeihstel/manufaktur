require "test_helper"

class Api::SeriesStepEntriesControllerTest < ActionController::TestCase
  setup do
    @series_step_entry = series_step_entries(:default)
    authenticate
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get series_step_entry" do
    get :show, format: :json, params: { id: @series_step_entry }
    assert_response :success
  end

  test "should create series_step_entry" do
    assert_difference "SeriesStepEntry.count" do
      post :create, format: :json, params: { 
        series_step_entry: {
          series_step_id: @series_step_entry.series_step_id,
          contact_id: @series_step_entry.contact_id,
          date: @series_step_entry.date,
          g10: @series_step_entry.g10
        }
      }
    end
    assert_response :success
  end

  test "should update series_step_entry" do
    patch :update, format: :json, params: {
      id: @series_step_entry,
      series_step_entry: @series_step_entry.attributes
    }
    assert_response :success
  end
end 