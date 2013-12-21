class CategoriesController < ApplicationController
  def new
    @existing_categories=Category.all
    @category=Category.new
  end

  def create
    category_params = params.require(:category).permit(:name)
    @category=Category.new(category_params)
    @existing_categories=Category.all

    if @category.save
      render :new
    else
      render :new
    end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update 
    category_params = params.require(:category).permit(:name)
    @category = Category.update(params[:id], category_params)
    if @category.save
       redirect_to @category, :flash => { :success => "success" }
    else
      render :edit
    end
  end

  def show
    @category=Category.find(params[:id])
  end

  
end
