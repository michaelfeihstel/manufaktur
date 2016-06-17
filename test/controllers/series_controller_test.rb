# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  finished_on :date
#  comment     :text
#  g1          :integer
#  g1h         :integer
#  g2          :integer
#  g2h         :integer
#  g3          :integer
#  g3h         :integer
#  g4          :integer
#  g4h         :integer
#  g5          :integer
#  g5h         :integer
#  g6          :integer
#  g6h         :integer
#  g7          :integer
#  g7h         :integer
#  g8          :integer
#  g8h         :integer
#  g9          :integer
#  g9h         :integer
#  g10         :integer
#  g10h        :integer
#  g11         :integer
#  g11h        :integer
#  g12         :integer
#  g12h        :integer
#  g13         :integer
#  g13h        :integer
#  g14         :integer
#  g14h        :integer
#  g15         :integer
#  g16         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :integer
#

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
