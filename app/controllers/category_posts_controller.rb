class CategoryPostsController < ApplicationController
	before_action :set_category_post, :only => [:show, :edit, :update, :destroy]

  def index
  	@category_posts = CategoryPost.all
  end

  def show
  end

  def edit
  end

  def new
  	@category_post = CategoryPost.new
  end

  def create
  	@category_post = CategoryPost.new(category_post_params)

  	respond_to do |format|
  		if @category_post.save
  			format.html { redirect_to @category_post }
  			flash[:success] = "Successfully created..."
  		else
  			format.html { render :new }
  			flash[:danger] = "Error..."
  			format.json { render json: @category_post.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def update
    respond_to do |format|
      if @category_post.update(category_post_params)
        format.html { redirect_to @category_post }
        flash[:success] = "Successfully updated..."
        format.json { render :show, status: :ok, location: @category_post }
      else
        format.html { render :edit }
        flash[:danger] = "Error..."
        format.json { render json: @category_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category_post.destroy
      respond_to do |format|
      format.html { redirect_to category_posts_url }
      flash[:success] = "Successfully destroyed..."
      format.json { head :no_content }
    end
  end

  private

  def category_post_params
  	params.require(:category_post).permit(:name, :description, :file)
  end

  def set_category_post
  	@category_post = CategoryPost.find(params[:id])
  end
end
