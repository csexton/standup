require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    login_as :quentin
    get :new
    assert_response :success
  end

  test "should create post" do
    login_as :quentin
    assert_difference('Post.count') do
      puts "in post count"
      post :create, :post => {
        :body => "Test post"
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, :id => posts(:one).id
    assert_response :success
  end

  test "should get edit" do
    login_as :quentin
    get :edit, :id => posts(:one).id
    assert_response :success
  end

  test "should update post" do
    login_as :quentin
    put :update, :id => posts(:one).id, :post => { :body => "Updated body" }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    login_as :quentin
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).id
    end

    assert_redirected_to posts_path
  end
end
