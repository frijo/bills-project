class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods, id: false do |t|
      t.string :code_food, null: false	
      t.string :food_name, null: false
      t.float :cost_price, null: false
      t.float :sale_price, null: false
      t.belongs_to :food_categories, index: true
      t.timestamps null: false
    end
     add_index :foods, :code_food, unique: true
     add_index :foods, :food_name, unique: true

  end
end
