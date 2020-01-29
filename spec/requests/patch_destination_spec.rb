require 'rails_helper'

describe "patch a destination route", :type => :request do
  destination = Destination.create!(:city => "Vancouver", :country => "USA", :specific_location => 'Eiffel Tower')
  before { get '/destinations'}

  # after(:all) do
  #   Destination.destroy_all
  # end

  it 'changes a destination\'s city' do
    put "/destinations/#{destination.id}", params: { :city => "New City", :country => "USA", :specific_location => 'Eiffel Tower' }
    expect(JSON.parse(response.body)['message']).to eq ("This destination has been updated successfully.")
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
