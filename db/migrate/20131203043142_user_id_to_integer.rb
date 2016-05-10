class UserIdToInteger < ActiveRecord::Migration
  def change
    change_column :items, :user_id, :integer
  end
end
