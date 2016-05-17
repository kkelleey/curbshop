class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  has_many :bids

  def highest_bid
    bids.last.bid
  end

  def highest_bidder
    highest_bid.user
  end

  def current_price
    bids.any? ? highest_bid : starting_price
  end

  def image_display
    picture || item_images[0].try(:image, :medium) || 'missing.jpeg'
  end
end
