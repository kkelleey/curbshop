class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :items, 'integer USING CAST(category AS integer)'
  end
end
