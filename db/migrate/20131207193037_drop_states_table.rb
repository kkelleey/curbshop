class DropStatesTable < ActiveRecord::Migration
  def change
  	drop_table :states
  end
end
