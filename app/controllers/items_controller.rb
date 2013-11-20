class ItemsController < ApplicationController
	def index
  	redirect_to user_root_path if user_signed_in?
  end

  	def shopping
  		@items=Item.all
  	end

  	def new
  		@item=Item.new 
      states=State.all
      @states=[]
      states.each do |state|
        @states<<state.state
      end  
  	end

    def create
      item_params = params.require(:item).permit(:category, :description, :picture, :starting_price,
        :city, :state)
      @item = Item.new(item_params)

      if @item.save
        redirect_to @item
      else
        render :new
      end
    end

    def show
      @item=Item.find(params[:id])
    end
end
