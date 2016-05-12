class CurbsController < ApplicationController
  def show
    @items_for_sale = Item.where user_id: current_user.id
    @items_bid_on = Bid
                    .select(:item_id)
                    .distinct
                    .where(user_id: current_user.id)
  end
end
