require 'test_helper'

class MemberProjectsControllerTest < ActionController::TestCase
  setup do
    @member_project = member_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_project" do
    assert_difference('MemberProject.count') do
      post :create, member_project: { project_id: @member_project.project_id, user_id: @member_project.user_id }
    end

    assert_redirected_to member_project_path(assigns(:member_project))
  end

  test "should show member_project" do
    get :show, id: @member_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_project
    assert_response :success
  end

  test "should update member_project" do
    patch :update, id: @member_project, member_project: { project_id: @member_project.project_id, user_id: @member_project.user_id }
    assert_redirected_to member_project_path(assigns(:member_project))
  end

  test "should destroy member_project" do
    assert_difference('MemberProject.count', -1) do
      delete :destroy, id: @member_project
    end

    assert_redirected_to member_projects_path
  end
end
