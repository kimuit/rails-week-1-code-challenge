class CreateRestaurantPizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_pizzas do |t|
      t.belongs_to :pizza
      t.belongs_to :restaurant
      # t.integer :pizza_id
      # t.integer :restaurant_id
      t.timestamps
    end
  end
end
