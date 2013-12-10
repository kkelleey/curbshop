class Bid < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	validate :not_own_item, :bid_greater_than_current_price, on: :create

	def not_own_item 
		if user_id == item.user_id
			errors.add(:bid, "can't bid on an item you own")
		end
	end
	

	def bid_greater_than_current_price
		if bid < item.current_price
			errors.add(:bid, "can't be lower than current price")
		end
	end


end



