class Item < ActiveRecord::Base

  #Very nice use of custom convenience methods (e.g. `highest_bid`)
  #Remember that Ruby employs an explicit return for methods, so you only need to specify them if your control flow absolutely requires it.
  #Also note usage of the ternary operator ( `condition ? true case : false case`) as syntactic sugar

	belongs_to :category
	belongs_to :user
	has_many :item_images, dependent: :destroy
	accepts_nested_attributes_for :item_images #Nice!
	has_many :bids

	def highest_bid
	  bids.last.bid
	end

	def highest_bidder
	  User.find(bids.last.user_id)
	end

	def current_price
    has_bids ? Bid.where(item_id: id).last.bid : starting_price
	end

	def has_bids
	  bids.count > 0
	end

	def sold
    return false unless has_bids
    bids.last.created_at < Date.today ? true : false
	end

	def imageDisplay #TskTsk, this method should be underscore_case, not camelCase
    picture || item_images[0].try(:image, :medium) || "missing.jpeg"
	end

end
