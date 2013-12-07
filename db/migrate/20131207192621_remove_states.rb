class RemoveStates < ActiveRecord::Migration
  def change
  	remove_column :items, :state 
  end
end
