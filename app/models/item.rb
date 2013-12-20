class Item < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :item_images, dependent: :destroy
	accepts_nested_attributes_for :item_images
	has_many :bids


	def highest_bid
		return bids.last.bid
	end

	def highest_bidder
		return User.find(bids.last.user_id)
	end

	def current_price
		if has_bids
			return Bid.where(item_id: id).last.bid
		else
			return starting_price
		end
	end

	def has_bids
		return bids.count > 0
	end

	def sold
		if has_bids 
			last_bid=bids.last
			if last_bid.created_at < Date.today
				return true
			else
				return false 
			end
		else
			return false
		end
	end

	def imageDisplay
		if !(picture.nil?)
			return picture
		else
			if !(item_images[0].nil?)
				return item_images[0].image(:medium)
			else
				return "missing.jpeg"
			end
		end
	end
end
