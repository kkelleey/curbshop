class Bid < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	#validates_with 
end



