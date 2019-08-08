class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def create
    @comment = @commentable.comments.new comment_params
    @comment.save
    respond_to do |format|
      format.js { render :nothing => true, :head => :ok } 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def find_commentable
	  if params[:category_id]
	    @commentable = Category.find_by_id(params[:category_id]) 
	  elsif params[:category_post_id]
	    @commentable = CategoryPost.find_by_id(params[:category_post_id])
	  end
	end
end
