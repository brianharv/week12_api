require 'rails_helper'

describe Review do

  describe "post a review route", :type => :request do

    before do
      post '/reviews', params: { :username => 'test_username', :body => 'test_body', :rating => rand(1..5), :country => 'test_country', :city => 'test_city' }
    end

    it 'returns the username' do
      expect(JSON.parse(response.body)['username']).to eq('test_username')
    end

    it 'returns the body' do
      expect(JSON.parse(response.body)['body']).to eq('test_body')
    end

    # returns 0 every time?
    it 'returns the rating' do
      expect(JSON.parse(response.body)['rating']).to be_between(1, 5)
    end

    it 'returns the rating' do
      expect(JSON.parse(response.body)['rating']).not_to be(0)
    end
    
    it 'returns the rating' do
      expect(JSON.parse(response.body)['rating']).to be < 6
    end
    
    
    it 'returns the quote content' do
      expect(JSON.parse(response.body)['body']).to eq('test_body')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns the city' do
      expect(JSON.parse(response.body)['city']).to eq('test_city')
    end  

    it 'returns the country' do
      expect(JSON.parse(response.body)['country']).to eq('test_country')
    end 
  
  end 
end  