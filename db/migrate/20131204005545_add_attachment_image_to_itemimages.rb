class AddAttachmentImageToItemimages < ActiveRecord::Migration
  def self.up
    change_table :item_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :item_images, :image
  end
end
