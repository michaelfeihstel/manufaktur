require "test_helper"

class Api::SeriesControllerTest < ActionController::TestCase
  
  setup do
    @series = series(:default_series)
  end



  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:series)
  end

  test "should show series" do
    get :show, format: :json, id: @series
    assert_response :success
    assert_not_nil assigns(:series)
  end

  test "should create new series" do
    assert_difference "Series.count" do
      post :create, format: :json, series: { product_id: @series.product_id }
    end
  end

  test "should update series" do
    patch :update, format: :json, id: @series, series: { product_id: @series.product_id, g1: @series.g1 }
  end

end