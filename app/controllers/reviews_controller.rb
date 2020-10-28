class ReviewsController < ApplicationController

  def index # GET http://localhost:3000/reviews
    # @reviews = Review.all
    if params[:search_by_rating]
      @reviews = Review.search_by_rating(params[:search_by_rating])
    elsif params[:location_id]
      @location = Location.find(params[:location_id])
      @reviews = @location.reviews
    else
      @reviews = Review.all  
    end  
    json_response(@reviews)
  end

  def show # GET http://localhost:3000/reviews/:id
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create # POST http://localhost:3000/reviews
    @location = Location.find(params[:location_id])
    if @review = @location.reviews.create!(review_params)
      json_response(@review, :created)
    else
      json_response(@review)  
    end  
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
    if @review.destroy
        render status: 200, json: {
        message: "This review has been deleted successfully."
        }
    end  
  end
  

  private

  def review_params
    params.permit(:username, :body, :rating, :country, :city)
  end
end    