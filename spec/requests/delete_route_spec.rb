require 'rails_helper'

describe "DELETE request", :type => :request do
  let!(:review) { FactoryBot.create(:review, :username => 'tacocat', :city => 'London', :country => 'United Kingdom', :body => "Great place to visit", :rating => 5, :id => 1)}

  before do
    delete '/reviews/1', params: { :username => 'test_username', :body => 'test_body', :rating => rand(1..5), :country => 'test_country', :city => 'test_city' } 
  end  

  it 'returns a status code 200' do
    expect(response).to have_http_status(:success)
  end
end