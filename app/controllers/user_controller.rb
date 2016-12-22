class UserController < ApplicationController
  def index
    @users = User.all
  end
  def show
  	@users = User.find(params[:id])
  	@projects = Project.joins(:member_project).where( "member_projects.user_id" => params[:id],:status_project => "active")
  	@activities = Activity.where(:user_id => params[:id]).order(created_at: :desc)
    @member_projects = MemberProject.where(:user_id => params[:id])
  end 
  def destroy
  	respond_to do |format|
      if @users.update({:user_status => "disable"})
        format.html { redirect_to @users, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
  
      if @user.save
  
        format.html { redirect_to @user, notice: 'User was successfully created.' }
  
        format.json { render :show, status: :created, location: @user }
  
      else
  
        format.html { render :new }
  
        format.json { render json: @user.errors, status: :unprocessable_entity }
  
      end
  
    end
  
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
    
      if user_params[:password].blank?
    
        if @user.update(user_params_update)
    
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
    
          format.json { render :show, status: :ok, location: @user }
    
        else
    
          format.html { render :edit }
    
          format.json { render json: @user.errors, status: :unprocessable_entity }
    
        end
    
      else
    
        if @user.update(user_params)
    
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
    
          format.json { render :show, status: :ok, location: @user }
    
        else
    
          format.html { render :edit }
    
          format.json { render json: @user.errors, status: :unprocessable_entity }
    
        end
    
      end
    
    end
  
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :role,:quota)
    end
    def user_params_update
      params.require(:user).permit(:email, :name, :role,:quota)
    end

end

