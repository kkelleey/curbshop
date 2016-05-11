class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(safe_bid_params)
    if @bid.save
      redirect_to @bid
    else
      flash.now[:error] = 'Could not save bid'
      redirect_to shopping_path
    end
  end

  def show
    @bid = Bid.find(params[:id])
    @image = @bid.item.image_display
  end

  private

  def safe_bid_params
    params.require(:bid).permit(:user_id, :bid, :item_id)
  end
end
