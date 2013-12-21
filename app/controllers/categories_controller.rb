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

  
end
