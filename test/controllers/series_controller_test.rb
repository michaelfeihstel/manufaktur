require "test_helper"

class SeriesControllerTest < ActionController::TestCase
  setup do
    @user = users(:default_user)
    @series = series(:default_series)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:series)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:series).new_record?
  end

  test "should create new" do
    assert_difference "Series.count" do
      post :create, series: @series.attributes 
    end
    assert_redirected_to assigns(:series)
  end

  test "should get edit" do
    get :edit, id: @series
    assert_response :success
  end

  test "should update series" do
    patch :update, id: @series, series: @series.attributes
    assert_redirected_to series_path(assigns(:series))
  end

  test "should delete series" do
    assert_difference "Series.count", -1 do
      delete :destroy, id: @series
    end
    assert_redirected_to series_index_path
  end
end