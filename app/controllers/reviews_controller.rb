class ReviewsController < ApplicationController

  def index # GET http://localhost:3000/reviews
    @reviews = Review.all
    json_response(@reviews)
  end

  def show # GET http://localhost:3000/reviews/:id
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create # POST http://localhost:3000/reviews
    @review = Review.create(review_params)
    json_response(@review)
  end

  def update # PUT http://localhost:3000/quotes/:id
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  def destroy # DELETE http://localhost:3000/quotes/:id
    @review = Review.find(params[:id])
    @review.destroy
  end
  

  private

  def json_response( object, status = :ok)
    render json: object, status: status
  end
  def review_params
    params.permit(:username, :body, :rating, :country, :city)
  end
end    