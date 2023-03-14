class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all

    # WE can use the only flag to serialize what i want to be rendered
    # WE can also use the except keyword which works the opposite of only excluding the stated 
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    if cheese
    render json: cheese
    else
      render json: {error: "Cheese not found"}, status: 404
    end
  end

end
