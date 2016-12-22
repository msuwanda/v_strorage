class MemberProjectsController < ApplicationController
  before_action :set_member_project, only: [:show, :edit, :update, :destroy]

  def index
    @member_projects = MemberProject.joins(:user).where(:project_id => params[:project_id])
    @project = Project.find(params[:project_id])
  end

  def show
  end

  def new
    @member_project = MemberProject.new
    respond_with(@member_project)
  end

  def edit
  end

  def create

    @user_count = User.where(:email => params[:username]).count

    @user = params[:mail]

    respond_to do |format|
      
      if @user_count == 0  
   
         @user_mail = UserMailer.invite_email(@user)
          if @user_mail.deliver

            format.html { redirect_to projects_path, notice: 'Email Invete has send.' }

          end
      else    
            
            @getid_user = User.where(:email => params[:username])
                     
                  @getid_user.each do |user| 
      
                      @getid = user.id 

                  end 
                
                    @member_project = MemberProject.new({:project_id => params[:project_id],:user_id => @getid, :status => 0 })
                  
                  if @member_project.save

                    format.html { redirect_to @member_project, notice: 'Member was successfully created.' }
                
                    format.json { render :show, status: :created, location: @member_project }
                
                  end  
     
      end
    end
  end

  def update
    @member_project.update(member_project_params)
    respond_with(@member_project)
  end

  def destroy
    @member_project.destroy
    respond_with(@member_project)
  end

  private
    def set_member_project
      @member_project = MemberProject.find(params[:id])
    end

    def member_project_params
      params.require(:member_project).permit(:project_id, :user_id)
    end
end
