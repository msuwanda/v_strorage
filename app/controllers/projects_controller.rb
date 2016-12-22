class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index 
      @projects = Project.joins(:member_project).where( "member_projects.user_id" => current_user.id,:status_project => "active")
  end
  def admin
      @projects = Project.where(:status_project => "active")
  end

  def welcome
      @projects = Project.where(:status_project => "active")
  end

  def autocomplete

    @products = ProjectCategory.order(:hashtag).where("hashtag LIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { 
        render json: @products.map(&:hashtag)
      }
    end
  end
  
  def autocomplete_user

    @products = User.order(:email).where("email LIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { 
        render json: @products.map(&:email)
      }
    end
  end
  
  # GET /projects/1
  # GET /projects/1.json
  def show
    @member_project = MemberProject.joins(:user).where(:project_id => params[:id]).first(5)
    @post_project = PostProject.new
    @post_projects = PostProject.where(:project_id => params[:id])
    @comment_post = CommentPost.new
    @storages = Storage.new
    @storage = Storage.where(:project_id => params[:id]).last(5)
    @storagesum = Storage.where(:user_id => current_user.id)
  end

  def storages
    @storages = Storage.where(:project_id => params[:project_id])
    @project = Project.find(params[:project_id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create

    @project_count = ProjectCategory.where(:hashtag => params[:hashtag]).count

    respond_to do |format|
   
      if @project_count == 0  
   
        @project_category = ProjectCategory.new({:hashtag => params[:hashtag]})

          if @project_category.save
                
                @getid_procategory = ProjectCategory.where(:hashtag => params[:hashtag])
                     
                  @getid_procategory.each do |project| 
      
                      @getid = project.id 

                  end 
                
                @project = Project.new({:name => params[:name], :project_category_id => @getid,:user_id => current_user.id, :status_project => "active"})
                
                  if @project.save 

                    @getid_project = Project.where(:name => params[:name])

                      @getid_project.each do |project| 
        
                        @getid_p = project.id 

                      end 

                      @member_project = MemberProject.new({:project_id => @getid_p,:user_id => current_user.id, :status => 1 })
                      
                      @activity = Activity.new({:project_id => @getid_p, :user_id => current_user.id, :activity => "has created project" })
                      
                      if @member_project.save and @activity.save

                          format.html { redirect_to @project, notice: 'Project was successfully created.' }
                      
                          format.json { render :show, status: :created, location: @project }
                      end

                  end  
          
          end 

      else    
            
            @getid_procategory = ProjectCategory.where(:hashtag => params[:hashtag])
                     
                  @getid_procategory.each do |project| 
      
                      @getid = project.id 

                  end 
                
                @project = Project.new({:name => params[:name], :project_category_id => @getid,:user_id => current_user.id, :status_project => "active" })
                
                  if @project.save 
                   
                    @getid_project = Project.where(:name => params[:name])

                      @getid_project.each do |project| 
        
                        @getid_p = project.id 

                      end 

                      @member_project = MemberProject.new({:project_id => @getid_p,:user_id => current_user.id, :status => 1 })

                      @activity = Activity.new({:project_id => @getid_p, :user_id => current_user.id, :activity => "has created project" })
                      
                      if @member_project.save and @activity.save

                          format.html { redirect_to @project, notice: 'Project was successfully created.' }
                      
                          format.json { render :show, status: :created, location: @project }
                      end
                
                  end  
     
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    respond_to do |format|
      if @project.update({:status_project => "disable"})
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.


end
