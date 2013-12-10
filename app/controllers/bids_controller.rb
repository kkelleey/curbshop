class BidsController < ApplicationController
	def new
		@bid=Bid.new
	end


	def create
		bid_params = params.require(:bid).permit(:user_id, :bid, :item_id)
      	@bid = Bid.new(bid_params)

     	if @bid.save
     		redirect_to shopping_path, notice: 'Bid successfully created'
     	else
     		redirect_to bid_error_path
    	end
	end

	def update
	end

	def show
	end

	def bid_error
	end
	
end