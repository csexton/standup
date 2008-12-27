require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    login_as :quentin
    get :new
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should create subscription" do
    login_as :quentin
    assert_difference('Subscription.count') do
      post :create, :subscription => { }
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, :id => subscriptions(:one).id
    assert_response :success
  end

  test "should get edit" do
    login_as :quentin
    get :edit, :id => subscriptions(:one).id
    assert_response :success
  end

  test "should update subscription" do
    login_as :quentin
    put :update, :id => subscriptions(:one).id, :subscription => { }
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should destroy subscription" do
    login_as :quentin
    assert_difference('Subscription.count', -1) do
      delete :destroy, :id => subscriptions(:one).id
    end

    assert_redirected_to subscriptions_path
  end
end
