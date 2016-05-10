class BidsController < ApplicationController

	def new
		@bid = Bid.new
	end


	def create
    @bid = Bid.new(safe_bid_params)
    if @bid.save
      redirect_to @bid
    else
      flash.now[:error] = "Could not save bid"
      redirect_to shopping_path
    end
	end

	def update
    #Make sure to put a comment in here that notes this method should be empty
	end

	def show
		@bid = Bid.find(params[:id])
		@image = @bid.item.image_display #Does the accessor imageDisplay work?  If so, change to underscore_case (image_display)
	end

  private

    def safe_bid_params
		  params.require(:bid).permit(:user_id, :bid, :item_id)
    end
	
end
