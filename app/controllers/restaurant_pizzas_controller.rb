class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response

  def create
    res = RestaurantPizza.create!(res_params)
    render json: res, status: :created
  end

  def index
    res = RestaurantPizza.all
    render json: res, status: :ok
  end

  private

  def restaurant_pizza_params
    params.permit(:price, :restaurant_id, :pizza_id)
  end

  def render_unprocessable_entity_response(invalid)
    render json: {
             error: invalid.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
