class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :price, :restaurant_id, :pizza_id
  belongs_to :pizza
end
