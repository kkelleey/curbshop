class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @bid = Bid.new
    @categories = Category.all
    if params[:category_id].blank?
      @items = Item.all
    else
      @items = Item.where(category_id: params[:category_id], sold: false).to_a
    end
  end

  def new
    @user_id = current_user.id
    @instagram_images = current_user.instagram_images
    @user = User.find(@user_id)
    @item = Item.new
    3.times { @item.item_images.build }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Success! Your item is now on your curb.'
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @bid = Bid.new
  end

  def destroy
    if @item.destroy
      flash[:success] = 'Success! Your item has been removed from your curb'
    else
      flash[:danger] = 'Sorry, we were unable to remove your item'
    end
    redirect_to curb_path
  end

  def edit
    @instagram_images = current_user.instagram_images
    @user_id = current_user.id
    @user = User.find(@user_id)
    3.times { @item.item_images.build }
  end

  def update
    if @item.update_attributes(update_safe_item_params)
      flash[:success] = 'Success! Your item has been updated.'
      redirect_to @item
    else
      flash[:danger] = "We couldn't update your item. Please try again."
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :category_id, :description, :picture, :item_image, :user_id,
      :starting_price, :city, item_images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end

  def update_safe_item_params
    params.require(:item).permit(
      :category_id, :picture, :starting_price, :description, :city
    )
  end

  def set_item
    @item = current_user.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'You are not authorized to perform this action'
    redirect_to request.referrer || root_path
  end
end
