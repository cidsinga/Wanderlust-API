class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  private


end
