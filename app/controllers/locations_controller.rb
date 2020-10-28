class LocationsController < ApplicationController

  def index # GET http://localhost:3000/locations
    @locations = Location.all
    if params[:search_by_rating]
      @locations = Location.search_by_rating(params[:search_by_rating])
    else
      @locations = Location.all  
    end  
    json_response(@locations)
  end

  def show # GET http://localhost:3000/locations/:id
    @location = Location.find(params[:id])
    json_response(@location)
  end

  def create # POST http://localhost:3000/locations
    if @location = Location.create!(location_params)
      json_response(@location, :created)
    else
      json_response(@location)  
    end  
  end

  def update # PUT http://localhost:3000/locations/:id
    @location = Location.find(params[:id])
    if @location.update!(location_params)
      render status: 200, json: {
        message: "This location has been updated successfully."
    }
    end  
  end

  def destroy # DELETE http://localhost:3000/locations/:id
    @location = Location.find(params[:id])
    if @location.destroy
        render status: 200, json: {
        message: "This location has been deleted successfully."
        }
    end  
  end
  

  private

  def location_params
    params.permit(:username, :body, :rating, :country, :city)
  end
end    