class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :picture
      t.integer :starting_price
      t.integer :highest_bid
      t.text :description
      t.string :city
      t.string :state
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
