class DestinationsController < ApplicationController

  def index
    # http://localhost:3000/destinations?country=Marshall-Islands
    country = params[:country]
    city = params[:city]
    specific_location = params[:specific_location]
    binding.pry
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "This destination has been updated successfully."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private


  def destination_params
    params.permit(:country, :city, :specific_location)
  end

end
