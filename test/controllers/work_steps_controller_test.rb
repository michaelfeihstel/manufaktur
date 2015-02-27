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
      post :create, work_step: @work_step.attributes
    end
    assert_redirected_to assigns(:work_step)
  end

  test "should get edit" do
    get :edit, id: @work_step
    assert_response :success
    assert_not_nil assigns(:work_step)
  end

  test "should update work step" do
    patch :update, id: @work_step, work_step: @work_step.attributes
    assert_redirected_to assigns(:work_step)
  end

end