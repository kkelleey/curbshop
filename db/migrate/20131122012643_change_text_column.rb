class ChangeTextColumn < ActiveRecord::Migration
  def change
  	change_column :category, :text, :name
  end
end
