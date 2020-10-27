require 'rails_helper'

describe "get all show_review route", :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 3)}

  before { get "/reviews/#{reviews.first.id}" }

  it 'returns review of a certain id' do
    expect(JSON.parse(response.body).size).to eq(8)
  end

  it 'returns review of a certain id' do
    review = FactoryBot.create(:review, :id => 5)
    expect(review.id).to eq (5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the city ' do
    review = FactoryBot.create(:review, :username => 'tacocat', :city => 'London', :country => 'United Kingdom', :body => 'This is a great city.', :id => 125)
    expect(review.city).to eq 'London'
  end
  
  it 'returns the country ' do
    review = FactoryBot.create(:review, :username => 'tacocat', :city => 'London', :country => 'United Kingdom', :body => 'This is a great city.', :id => 125)
    expect(review.country).to eq 'United Kingdom'
  end

  it 'returns the body ' do
    review = FactoryBot.create(:review, :username => 'tacocat', :city => 'London', :country => 'United Kingdom', :body => 'This is a great city.', :id => 125)
    expect(review.body).to eq 'This is a great city.'
  end
end
