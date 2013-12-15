class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 

   def instagram_images
   		if instagram_username.nil?
   			return nil
   		else
   			Instagram.configure do |config|
	  			config.client_id = "8e29ac2743964cb4844c022fc7a2ee08"
	  			config.client_secret = "ee7b3c9f5aeb47429391196cd8f06c70"
			end
			instagram_id=Instagram.user_search(instagram_username).first.id
			last_url=Instagram.user_recent_media(instagram_id).last.images.thumbnail.url
			urls=[]
			Instagram.user_recent_media(instagram_id).each do |image|
				urls<<image.images.thumbnail.url
			end
			return urls
		end
	end
end
