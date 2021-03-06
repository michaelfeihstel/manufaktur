# == Schema Information
#
# Table name: work_steps
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  final_step :boolean          default(FALSE)
#

require "test_helper"

class WorkStepsControllerTest < ActionController::TestCase

  setup do
    @user = users(:default_user)
    @work_step = work_steps(:default_work_step)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:work_step).new_record?
  end

  test "should create work step" do
    assert_difference "WorkStep.count" do
      post :create, params: { work_step: @work_step.attributes }
    end
    assert_redirected_to assigns(:work_step)
  end

  test "should get edit" do
    get :edit, params: { id: @work_step }
    assert_response :success
    assert_not_nil assigns(:work_step)
  end

  test "should update work step" do
    patch :update, params: { id: @work_step, work_step: @work_step.attributes }
    assert_redirected_to assigns(:work_step)
  end

end
