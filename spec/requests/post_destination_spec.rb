require 'rails_helper'

describe "post a destination route", :type => :request do

  before do
    Destination.destroy_all
    post '/destinations', params: { :city => 'City', :country => 'Country', :specific_location => 'Specific Location' }
  end

  it 'returns the city name' do
    expect(JSON.parse(response.body)['city']).to eq('City')
  end

  it 'returns the destination country' do
    expect(JSON.parse(response.body)['country']).to eq('Country')
  end

  it "returns the destination's specific_location" do
    expect(JSON.parse(response.body)['specific_location']).to eq('Specific Location')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end
