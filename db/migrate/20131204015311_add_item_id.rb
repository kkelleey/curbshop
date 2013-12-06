class AddItemId < ActiveRecord::Migration
  def change
  	add_column :item_images, :item_id, :integer
  end
end
