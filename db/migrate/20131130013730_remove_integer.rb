class RemoveInteger < ActiveRecord::Migration
  def change
  	remove_column :items, :integer
  end
end
