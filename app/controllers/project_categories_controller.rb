class ProjectCategoriesController < ApplicationController
  before_action :set_project_category, only: [:show, :edit, :update, :destroy]

  def index
    @project_categories = ProjectCategory.all
  end

  def show
  end

  def new
    @project_category = ProjectCategory.new
  end

  def edit
  end

  def create
    @project_category = ProjectCategory.new(project_category_params)
    respond_to do |format|
      if @project_category.save
        format.html { redirect_to @project_category, notice: 'Project category was successfully created.' }
        format.json { render :show, status: :created, location: @project_category }
      else
        format.html { render :new }
        format.json { render json: @project_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project_category.update(project_category_params)
  end

  def destroy
    @project_category.destroy
  end

  private
    def set_project_category
      @projects = Project.where(:hashtag => params[:id])
    end

    def project_category_params
      params.require(:project_category).permit(:hashtag)
    end
end
