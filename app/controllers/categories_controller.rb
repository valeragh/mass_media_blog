class CategoriesController < ApplicationController
  before_action :set_category, :only => [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.all
  end

  def show
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

  	respond_to do |format|
  		if @category.save
  			format.html { redirect_to @category }
  			flash[:success] = "Successfully created..."
  		else
  			format.html { render :new }
  			flash[:danger] = "Error..."
  			format.json { render json: @category.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category }
        flash[:success] = "Successfully updated..."
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        flash[:danger] = "Error..."
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
      respond_to do |format|
      format.html { redirect_to categories_url }
      flash[:success] = "Successfully destroyed..."
      format.json { head :no_content }
    end
  end

  private

  def category_params
  	params.require(:category).permit(:name, :description)
  end

  def set_category
  	@category = Category.find(params[:id])
  end
end
