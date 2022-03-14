class BirdsController < ApplicationController
  wrap_parameters format:[]
  # GET /birds
  def create 
 
    bird = Bird.create(bird_parameter)
    render json: bird, status: :created
  end

  def index

    birds = Bird.all
    render json: birds
  
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end






    private 

    def bird_parameter
      params.permit(:name, :species)
    end


  end


