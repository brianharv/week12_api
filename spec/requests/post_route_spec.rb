require 'rails_helper'

describe "post a review route", :type => :request do

  before do
    post '/reviews', params: { :username => 'test_username', :body => 'test_body', :rating => 'test_rating', :country => 'test_country', :city => 'test_city' }
  end

  it 'returns the username' do
    expect(JSON.parse(response.body)['username']).to eq('test_username')
  end

  it 'returns the quote content' do
    expect(JSON.parse(response.body)['body']).to eq('test_body')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end