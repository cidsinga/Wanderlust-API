class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

end
