require 'test_helper'

class PostProjectsControllerTest < ActionController::TestCase
  setup do
    @post_project = post_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_project" do
    assert_difference('PostProject.count') do
      post :create, post_project: { content: @post_project.content, project_id: @post_project.project_id, user_id: @post_project.user_id }
    end

    assert_redirected_to post_project_path(assigns(:post_project))
  end

  test "should show post_project" do
    get :show, id: @post_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_project
    assert_response :success
  end

  test "should update post_project" do
    patch :update, id: @post_project, post_project: { content: @post_project.content, project_id: @post_project.project_id, user_id: @post_project.user_id }
    assert_redirected_to post_project_path(assigns(:post_project))
  end

  test "should destroy post_project" do
    assert_difference('PostProject.count', -1) do
      delete :destroy, id: @post_project
    end

    assert_redirected_to post_projects_path
  end
end
