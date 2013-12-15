class RemoveEmailAddress < ActiveRecord::Migration
  def change
  	remove_column :users, :email_address
  end
end
