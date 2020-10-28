require 'rails_helper'

describe "get all reviews route", :type => :request do
  # let!(:reviews) { FactoryBot.create_list(:review, 5)}
  let!(:location) { FactoryBot.create(:location_with_reviews) }

  # before { get '/reviews'}
  before { get "/locations/#{location.id}/reviews"}

  it 'returns all reviews' do
    #binding.pry
    expect(JSON.parse(response.body).size).to eq(5)
    
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end