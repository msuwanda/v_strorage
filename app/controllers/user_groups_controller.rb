class UserGroupsController < ApplicationController
  before_action :set_user_group, only: [:show, :edit, :update, :destroy]

  def index
    @user_groups = UserGroup.all
  end

  def show
    respond_with(@user_group)
  end

  def new
    @user_group = UserGroup.new
    respond_with(@user_group)
  end

  def edit
  end

  def create
    @user_group = UserGroup.new({:group_id => params[:group_id], :user_id => params[:user_id], :owner_status => 0})
    @user_group.save
    respond_to do |format|
      format.html { redirect_to group_path(params[:group_id]), notice: 'Project category was successfully created.' }
    end
  end
  def invite
    @user = params[:email]
    @url  = params[:url]
    @send = params[:send]
    @user_mail = UserMailer.invite_group(@user,@url,@send)
    @user_mail.deliver
    respond_to do |format|
      format.html { redirect_to group_path(params[:url]), notice: 'invitation has send' }
    end
  end

  def update
    @user_group.update(user_group_params)
    respond_with(@user_group)
  end

  def destroy
    @user_group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Project category was successfully created.' }
    end
  end

  private
    def set_user_group
      @user_group = UserGroup.find(params[:id])
    end

    def user_group_params
      params.require(:user_group).permit(:group_id, :user_id)
    end
end
