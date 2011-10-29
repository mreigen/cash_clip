require 'test_helper'

class BillPointsControllerTest < ActionController::TestCase
  setup do
    @bill_point = bill_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_point" do
    assert_difference('BillPoint.count') do
      post :create, bill_point: @bill_point.attributes
    end

    assert_redirected_to bill_point_path(assigns(:bill_point))
  end

  test "should show bill_point" do
    get :show, id: @bill_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_point.to_param
    assert_response :success
  end

  test "should update bill_point" do
    put :update, id: @bill_point.to_param, bill_point: @bill_point.attributes
    assert_redirected_to bill_point_path(assigns(:bill_point))
  end

  test "should destroy bill_point" do
    assert_difference('BillPoint.count', -1) do
      delete :destroy, id: @bill_point.to_param
    end

    assert_redirected_to bill_points_path
  end
end
