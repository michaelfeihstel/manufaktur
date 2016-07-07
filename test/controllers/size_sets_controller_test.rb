# == Schema Information
#
# Table name: size_sets
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  g1         :string
#  g1h        :string
#  g2         :string
#  g2h        :string
#  g3         :string
#  g3h        :string
#  g4         :string
#  g4h        :string
#  g5         :string
#  g5h        :string
#  g6         :string
#  g6h        :string
#  g7         :string
#  g7h        :string
#  g8         :string
#  g8h        :string
#  g9         :string
#  g9h        :string
#  g10        :string
#  g10h       :string
#  g11        :string
#  g11h       :string
#  g12        :string
#  g12h       :string
#  g13        :string
#  g13h       :string
#  g14        :string
#  g14h       :string
#  g15        :string
#  g16        :string
#

require "test_helper"

class SizeSetsControllerTest < ActionController::TestCase

  setup do
    @size_set = size_sets(:default)
    @user =  users(:default_user)

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:size_sets)
  end

  test "should show size_set" do
    get :show, params: { id: @size_set }
    assert_response :success
    assert_not_nil assigns(:size_set)
  end

  test "should get edit for size_set" do
    get :edit, params: { id: @size_set }
    assert_response :success
    assert_not_nil assigns(:size_set)
  end

  test "should update size_set" do
    patch :update, params: { id: @size_set, size_set: @size_set.attributes }
    assert_redirected_to assigns(:size_set)
  end

  test "should create size_set" do
    post :create, params: { size_set: @size_set.attributes }
  end

end