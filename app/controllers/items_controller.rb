class ItemsController < ApplicationController

  before_action :authenticate_user!  #devise method
  	def shopping
  		@categories = Category.find(:all, :conditions => {:parent_id => nil } )
      @items = Item.all
      @bid=Bid.new
  	end

  	def new
      @user_id=current_user.id 
      @item=Item.new
      3.times{@item.item_images.build} 
      states=State.all
      @states=[]
      states.each do |state|
        @states<<state.state
      end  
  	end

    def create
      item_params = params.require(:item).permit(:category_id, :description, :item_image, :user_id, :starting_price,
        :city, :state, item_images_attributes: [:image])
      Rails.logger.debug "The params are #{item_params}"
      @item = Item.new(item_params)

      if @item.save
        redirect_to @item
      else
        render :new
      end
    end

    def show
      @item=Item.find(params[:id])
      category_id=@item.category_id
      category=Category.find(category_id)
      @category=category.name
      @description=@item.description
    end
end
