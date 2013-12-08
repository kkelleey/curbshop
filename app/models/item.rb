class Item < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :item_images, dependent: :destroy
	accepts_nested_attributes_for :item_images
	has_many :bids

	#for selling
	def sold_price
		return bids.last.bid
	end

	def highest_bidder
		return User.find(bids.last.user_id)
	end

	def has_bids
		return bids.count > 0
	end

	def sold
		if has_bids 
			last_bid=bids.last
			if last_bid.created_at < Date.tomorrow
				return true
			else
				return false 
			end
		else
			return false
		end
	end
	#end selling

	#start buying

end
