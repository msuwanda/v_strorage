class CommentPostsController < ApplicationController
  before_action :set_comment_post, only: [:show, :edit, :update, :destroy]

  def index
    @comment_posts = CommentPost.all
  end

  def show
    respond_with(@comment_post)
  end

  def new
    @comment_post = CommentPost.new
  end

  def edit
  end

  def create
    @comment_post = CommentPost.new(comment_post_params)
    respond_to do |format|
      if @comment_post.save
        format.html { redirect_to project_path(comment_post_params[:project_id]), notice: 'Post project was successfully updated.' }
      else
        format.html { redirect_to projects_path(params[:project_id]) }
      end
    end
  end

  def update
    @comment_post.update(comment_post_params)
    respond_with(@comment_post)
  end

  def destroy
    @comment_post.destroy
    respond_with(@comment_post)
  end

  private
    def set_comment_post
      @comment_post = CommentPost.find(params[:id])
    end

    def comment_post_params
      params.require(:comment_post).permit(:post_id, :project_id, :user_id, :content)
    end
end
