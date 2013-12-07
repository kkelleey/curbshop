class Item < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :item_images, dependent: :destroy
	accepts_nested_attributes_for :item_images
	has_many :bids	
end
