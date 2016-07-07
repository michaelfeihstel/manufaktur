require "test_helper"

class Api::SeriesControllerTest < ActionController::TestCase
  setup do
    @series = series(:default_series)
    authenticate
  end



  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should show series" do
    get :show, format: :json, params: { id: @series }
    assert_response :success
  end

  test "should create new series" do
    assert_difference "Series.count" do
      post :create, format: :json, params: {
        series: { product_id: @series.product_id }
      }
    end
    assert_response :success
  end

  test "should update series" do
    patch :update, format: :json, params: {
      id: @series,
      series: @series.attributes
    }
    assert_response :success
  end
end