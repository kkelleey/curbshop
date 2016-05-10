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
    bids.last.created_at < Date.today
  end

  def imageDisplay
    picture || item_images[0].try(:image, :medium) || "missing.jpeg"
  end
end
