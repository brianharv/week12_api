require 'rails_helper'

# describe "PUT request", :type => :request do
#   let!(:review) { FactoryBot.create(:review, :username => 'tacocat', :body => "Great place to visit", :rating => 5, :id => 1)}

#   before do
#     put '/reviews/1', params: { :username => 'test_username', :body => 'test_body', :rating => rand(1..5) } 
#   end  
  
#   it 'updates the body of review' do
#     expect(JSON.parse(response.body)['message']).to eq 'This review has been updated successfully.'
#   end

#   it 'returns a status code 200' do
#     expect(response).to have_http_status(:success)
#   end
# end
# We should always test to ensure that a route returns both the correct response body and the correct header.