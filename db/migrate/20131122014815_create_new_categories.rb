class CreateNewCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string      :name
      t.references  :parent
      t.timestamps
    end
  end
end

