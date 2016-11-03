require 'test_helper'

class InvadersControllerTest < ActionController::TestCase
  setup do
    @invader = invaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invader" do
    assert_difference('Invader.count') do
      post :create, invader: {  }
    end

    assert_redirected_to invader_path(assigns(:invader))
  end

  test "should show invader" do
    get :show, id: @invader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invader
    assert_response :success
  end

  test "should update invader" do
    patch :update, id: @invader, invader: {  }
    assert_redirected_to invader_path(assigns(:invader))
  end

  test "should destroy invader" do
    assert_difference('Invader.count', -1) do
      delete :destroy, id: @invader
    end

    assert_redirected_to invaders_path
  end
end
