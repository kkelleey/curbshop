class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :category do |t|
      t.string      :text
      t.references  :parent
      t.timestamps
    end
  end
end
