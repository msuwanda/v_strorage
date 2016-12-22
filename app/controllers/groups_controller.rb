class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index

    @formal = Group.where(:group_status => 'formal')

    @nonformal = Group.where(:group_status => 'nonformal').order('(SELECT count("user_groups"."user_id") FROM "user_groups" WHERE "user_groups"."group_id" = "groups"."id") DESC' )


  end

  def show

    @user_groups = UserGroup.joins(:user).where(:group_id => params[:id] )

    @joins_user = UserGroup.where(:user_id => current_user,:group_id => params[:id]  ).count

    @user_group = UserGroup.where(:user_id => current_user,:group_id => params[:id]  ).first

  end

  def checkname

    if Group.where('name = ?', params[:name]).count == 0

      render :nothing => true, :status => 200

    else

      render :nothing => true, :status => 409

    end

    return

  end

  def new

    @group = Group.new

  end

  def edit

  end

  def create

    if Group.where(group_params_check).count == 0

      @group = Group.new(group_params)

      respond_to do |format|

        if @group.save

          @getId = Group.where(group_params) 

            @getId.each do |project| 

              @getid = project.id 

            end

            @user_group = UserGroup.new({:group_id => @getid, :user_id => current_user.id, :owner_status => 1 })
           
            if @user_group.save

              format.html { redirect_to @group, notice: 'group was successfully created.' }
            
              format.json { render :show, status: :created, location: @group }
           
            else
              
              format.html { render :new }
              
              format.json { render json: @group.errors, status: :unprocessable_entity }
            
            end
        
        else
        
          format.html { render :new }
        
          format.json { render json: @group.errors, status: :unprocessable_entity }
        
        end
      
      end
    
    else
    
      @group = Group.new(group_params)
    
      respond_to do |format|
    
        format.html { render :new, notice: 'nama grup sudah ada' }
    
        format.json { render json: @group.errors, status: :unprocessable_entity }
    
      end
    
    end
    
  end

  def update

    if Group.where(group_params_check).count == 0

      respond_to do |format|

        if @group.update(group_params)

              format.html { redirect_to @group, notice: 'group was successfully update' }
            
              format.json { render :show, status: :created, location: @group }
       
        else
        
          format.html { render :new }
        
          format.json { render json: @group.errors, status: :unprocessable_entity }
        
        end
      
      end
    
    else
        
      respond_to do |format|
    
        format.html { redirect_to @group, notice: 'error update' }
        
      end
    
    end
  
  end

  def destroy
  
    @group.destroy
  
    respond_to do |format|
  
        format.html { redirect_to @group }
  
      end
  
  end

  private
  
    def set_group
  
      @group = Group.find(params[:id])
  
    end

  
    def group_params
  
      params.require(:group).permit(:name,:group_status)
  
    end

    def group_params_check
  
      params.require(:group).permit(:name)
  
    end
end
