class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response

  def index
    restaurants = Restaurant.all
    render json: restaurants, status: :ok
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, status: :ok
  end

  def create
    res = Restaurant.create!(restaurant_params)
    render json: res, status: :created
  end

  def update
    res = Restaurant.find(params[:id])
    res.update!(restaurant_params)
    render json: res, status: :ok
  end

  def destroy
    res = Restaurant.find(params[:id])
    res.destroy
    render json: no_content
  end

  private

  def restaurant_params
    params.permit(:name, :address)
  end

  def render_not_found_response
    render json: { error: "Restaurant not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: {
             error: invalid.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
