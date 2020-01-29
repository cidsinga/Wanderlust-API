require 'rails_helper'

describe "get all destinations route", :type => :request do
  Destination.destroy_all
  puts Destination.all
  let!(:destinations) { FactoryBot.create_list(:destination, 20)}
  before { get '/destinations'}

  it 'returns all destinations' do
    # p Destination.all
    expect(JSON.parse(response.body).size).to eq(21)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
