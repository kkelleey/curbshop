class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def instagram_images
    return [] unless instagram_username

    recent_media.first(6).map(&:images)
  end

  private

  def instagram_id
    Instagram.user_search(instagram_username).first.id
  end

  def recent_media
    Instagram.user_recent_media(instagram_id) || []
  end
end
