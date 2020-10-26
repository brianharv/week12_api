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
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update # PUT http://localhost:3000/reviews/:id
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "This review has been updated successfully."
    }
    end  
  end

  def destroy # DELETE http://localhost:3000/reviews/:id
    @review = Review.find(params[:id])
    @review.destroy
  end
  

  private

  def review_params
    params.permit(:username, :body, :rating, :country, :city)
  end
end    