require 'test_helper'

class PharmacologiesControllerTest < ActionController::TestCase
  setup do
    @pharmacology = pharmacologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pharmacologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pharmacology" do
    assert_difference('Pharmacology.count') do
      post :create, pharmacology: {  }
    end

    assert_redirected_to pharmacology_path(assigns(:pharmacology))
  end

  test "should show pharmacology" do
    get :show, id: @pharmacology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pharmacology
    assert_response :success
  end

  test "should update pharmacology" do
    patch :update, id: @pharmacology, pharmacology: {  }
    assert_redirected_to pharmacology_path(assigns(:pharmacology))
  end

  test "should destroy pharmacology" do
    assert_difference('Pharmacology.count', -1) do
      delete :destroy, id: @pharmacology
    end

    assert_redirected_to pharmacologies_path
  end
end
