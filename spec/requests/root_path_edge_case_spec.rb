require 'rails_helper'

describe "Anytime a get request is sent with invalid parameters" do
  it "It is caught in this path" do

    get "/"

    expect(response.status).to eq(404)
    expect(response.body).to eq("{\"error\":\"This endpoint is not supported\",\"status\":404}")
  end

  it "is caught in api/v1/ root path" do

    get '/api/v1'

    expect(response.status).to eq(404)
    expect(response.body).to eq("{\"error\":\"This endpoint is not supported\",\"status\":404}")
  end

  it "is caught in api/v1/ root path" do

    get '/api'

    expect(response.status).to eq(404)
    expect(response.body).to eq("{\"error\":\"This endpoint is not supported\",\"status\":404}")
  end
end
