class PizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response

  def index
    pizzas = Pizza.all
    render json: pizzas
  end

  # def show
  #   pizza = Pizza.find(params[:id])
  #   render json: pizza
  # end

  def create
    pizza = Pizza.create!(pizza_params)
    render json: pizza, status: :created
  end

  def destroy
    pizza = Pizza.find(params[:id])
    pizza.destroy
    head :no_content
  end

  private

  def pizza_params
    params.permit(:name, :ingredients)
  end

  def render_not_found_response
    render json: { error: "Pizza not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: {
             error: invalid.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
