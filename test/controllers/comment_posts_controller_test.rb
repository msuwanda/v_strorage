require 'test_helper'

class CommentPostsControllerTest < ActionController::TestCase
  setup do
    @comment_post = comment_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_post" do
    assert_difference('CommentPost.count') do
      post :create, comment_post: { content: @comment_post.content, post_id: @comment_post.post_id, project_id: @comment_post.project_id, user_id: @comment_post.user_id }
    end

    assert_redirected_to comment_post_path(assigns(:comment_post))
  end

  test "should show comment_post" do
    get :show, id: @comment_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_post
    assert_response :success
  end

  test "should update comment_post" do
    patch :update, id: @comment_post, comment_post: { content: @comment_post.content, post_id: @comment_post.post_id, project_id: @comment_post.project_id, user_id: @comment_post.user_id }
    assert_redirected_to comment_post_path(assigns(:comment_post))
  end

  test "should destroy comment_post" do
    assert_difference('CommentPost.count', -1) do
      delete :destroy, id: @comment_post
    end

    assert_redirected_to comment_posts_path
  end
end
