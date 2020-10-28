require 'rails_helper'

describe "get all locations route", :type => :request do
  let!(:locations) { FactoryBot.create_list(:location, 5)}


  before { get '/locations'}
 

  it 'returns all locations' do
    #binding.pry
    expect(JSON.parse(response.body).size).to eq(5)
    
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end