class ItemImage < ActiveRecord::Base
  #Nice use of Paperclip
	belongs_to :item 
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
