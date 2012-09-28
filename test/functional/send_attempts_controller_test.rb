require 'test_helper'

class SendAttemptsControllerTest < ActionController::TestCase
  setup do
    @send_attempt = send_attempts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:send_attempts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send_attempt" do
    assert_difference('SendAttempt.count') do
      post :create, send_attempt: { message: @send_attempt.message }
    end

    assert_redirected_to send_attempt_path(assigns(:send_attempt))
  end

  test "should show send_attempt" do
    get :show, id: @send_attempt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send_attempt
    assert_response :success
  end

  test "should update send_attempt" do
    put :update, id: @send_attempt, send_attempt: { message: @send_attempt.message }
    assert_redirected_to send_attempt_path(assigns(:send_attempt))
  end

  test "should destroy send_attempt" do
    assert_difference('SendAttempt.count', -1) do
      delete :destroy, id: @send_attempt
    end

    assert_redirected_to send_attempts_path
  end
end
