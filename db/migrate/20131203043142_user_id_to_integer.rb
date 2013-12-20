class UserIdToInteger < ActiveRecord::Migration
  def change
  	change_column :items, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
