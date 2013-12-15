class ItemsController < ApplicationController

  before_filter :authenticate_user!, :except => [:shopping]
  	def shopping
        @bid=Bid.new
        @categories=Category.all 
        if params[:category_id].blank?
          items=Item.all
        else
          items=Item.where(category_id: params[:category_id])
        end
        @items=[]
        items.each do |item|
          if ! item.sold
            @items<<item
          end
        end
  	end


  	def new
      @instagram_images=current_user.instagram_images
      @user_id=current_user.id 
      @user=User.find(@user_id)
      @item=Item.new
      3.times{@item.item_images.build}   
  	end

    def create
      item_params = params.require(:item).permit(:category_id, :description, :item_image, :user_id, :starting_price,
        :city, item_images_attributes: [:image])
      Rails.logger.debug "The params are #{item_params}"
      @item = Item.new(item_params)

      if @item.save
        redirect_to @item
      else
        render :new
      end
    end

    def curb
      user_id=current_user.id
      @items_for_sale=Item.where user_id: user_id
      @items_bid_on=Bid.select(:item_id).distinct.where(user_id: user_id)
    end

    def show
      @item=Item.find(params[:id])
    end
end
