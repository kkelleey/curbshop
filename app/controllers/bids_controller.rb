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
     		render :shopping
     	end
	end

	def update
	end

	def show
		@bid=Bid.find(params[:id])
	end
	
end