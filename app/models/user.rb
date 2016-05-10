class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def instagram_images
    return nil if instagram_username.nil?

    instagram_id = Instagram.user_search(instagram_username).first.id
    urls = []
    Instagram.user_recent_media(instagram_id).each do |image|
      urls << image.images
    end
    urls
  end
end
