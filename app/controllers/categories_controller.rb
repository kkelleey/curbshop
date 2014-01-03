class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def new
    @existing_categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(safe_category_params)
    @existing_categories = Category.all

    if @category.save
      render :new
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update 
    @category = Category.update(params[:id], safe_category_params)
    if @category.save
       redirect_to @category, :flash => { :success => "success" } #Can you use the Ruby 2.0 syntax here? flash: { success: "success" }
    else
      render :edit
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to new_category_path
  end

  private

    def safe_category_params
      params.require(:category).permit(:name)
    end

end
