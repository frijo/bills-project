class CreateFoodCategories < ActiveRecord::Migration
  def change
    create_table :food_categories do |t|
      t.string :category, null: false
      t.timestamps null: false
    end
    add_index :food_categories, :category, unique: true
  end
end
