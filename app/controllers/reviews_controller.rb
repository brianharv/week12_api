class ReviewsController < ApplicationController

  def index
    @reviews = {"body": "This was a great trip."} #this is hard coded and is not good for testing.
    json_response(@reviews)
  end

  private

  def json_response( object, status = :ok)
    render json: object, status: status
  end
end    