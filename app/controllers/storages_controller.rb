class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def index
    @storages = Storage.where(:user_id => current_user.id)
  end
  def admin
        @storages = Storage.joins(:user)

  end

  def show
  end

  def share
    @storage = Storage.where(:share_link => params[:storage_id])
  end

  def new
    @storage = Storage.new
    @storages = Storage.where(:user_id => current_user.id)
  end

  def project

  end

  def edit
  end

  def create
    @storages = Storage.where(:user_id => current_user.id)
    @storage  = Storage.new(storage_params)

    @quota = user_quota_params[:user_quota].to_f
    
    respond_to do |format|

      if storage_params[:file].size <= @quota.bytes

        if @storage.save

            format.html { redirect_to storages_path, notice: 'file was successfully uploded' }
        else
            
           format.html { render :new }
           format.json { render json: @storage.errors, status: :unprocessable_entity }
          
        end      
      
      else
            
          format.html { render :new }
          format.json { render json: @storage.errors, status: :unprocessable_entity }
          
      end
        
    end
  
  end

  def update
    @storage.update(storage_params)
  end

  def destroy
    
    respond_to do |format|

      

      if @storage.destroy and @storage.file.destroy

        format.html { redirect_to @storage, notice: 'file was successfully deleted' }
      
        format.json { render :show, status: :created, location: @storage }
     
      else
        
        format.html { render :new }
        
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      
      end
    end
  end

  private
    def set_storage
      @storage = Storage.find(params[:id])
    end

    def storage_params
      params.require(:storage).permit(:user_id,:file,:project_id,:share_link)
    end
    def user_quota_params 
      params.require(:storage).permit(:user_quota)
    end
end   
