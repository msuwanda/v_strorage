class PostProjectsController < ApplicationController
  before_action :set_post_project, only: [:show, :edit, :update, :destroy]

  def index
    @post_projects = PostProject.all
  end

  def show
  end

  def new
    @post_project = PostProject.new
  end

  def edit
  end

  def create
    @post_project = PostProject.new(post_project_params)
    @activity = Activity.new(post_activity)
    respond_to do |format|
      if @post_project.save and @activity.save
        format.html { redirect_to project_path(post_project_params[:project_id]), notice: 'Post project was successfully updated.' }
      else
        format.html { redirect_to projects_path(params[:project_id]) }
      end
    end
  end

  def update
    @post_project.update(post_project_params)
  end

  def destroy
    @post_project.destroy
  end

  private
    def set_post_project
      @post_project = PostProject.find(params[:id])
    end

    def post_project_params
      params.require(:post_project).permit(:project_id, :user_id, :content)
    end
    def post_activity
      params.require(:post_project).permit(:project_id, :user_id, :activity)
    end
end
