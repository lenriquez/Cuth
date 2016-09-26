require 'rails_helper'
require 'json'

describe "CRUD for keys" do
  it "Test the  create and delete " do
    # Variables needed
    id = ""

    # Check keys available 
    get '/api/v1/keys'
    expect(response).to be_success
    count = JSON.parse(response.body).size

    # Create Key 
    post "/api/v1/keys",
    params: {
      title: 'Gmail',
      user: 'felipe096',
      url: 'www.gmail.com',
      password: '12456',
      comments: 'N/A'
    }
    expect(response).to be_success
    id = JSON.parse(response.body)['_id']['$oid']

    # Check new keys has been added
    get '/api/v1/keys'
    expect(response).to be_success
    expect(JSON.parse(response.body).size).to eq(count + 1)

    # Delete the created key
    delete "/api/v1/keys/#{id}"
    expect(response).to be_success

    # Check new keys has been deleted
    get '/api/v1/keys'
    expect(response).to be_success
    expect(JSON.parse(response.body).size).to eq(count)

  end
end