class Bid < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	validate :bid_greater_than_current_price, on: :create
	
	def bid_greater_than_current_price
		if bid < item.current_price
			errors.add(:bid, "can't be lower than current price")
		end
	end

end



