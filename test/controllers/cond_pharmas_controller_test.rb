require 'test_helper'

class CondPharmasControllerTest < ActionController::TestCase
  setup do
    @cond_pharma = cond_pharmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cond_pharmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cond_pharma" do
    assert_difference('CondPharma.count') do
      post :create, cond_pharma: {  }
    end

    assert_redirected_to cond_pharma_path(assigns(:cond_pharma))
  end

  test "should show cond_pharma" do
    get :show, id: @cond_pharma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cond_pharma
    assert_response :success
  end

  test "should update cond_pharma" do
    patch :update, id: @cond_pharma, cond_pharma: {  }
    assert_redirected_to cond_pharma_path(assigns(:cond_pharma))
  end

  test "should destroy cond_pharma" do
    assert_difference('CondPharma.count', -1) do
      delete :destroy, id: @cond_pharma
    end

    assert_redirected_to cond_pharmas_path
  end
end
