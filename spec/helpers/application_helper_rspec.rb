require 'rails_helper'

describe ApplicationHelper, type: :helper do
  it 'get data from webservice' do
    uri = 'www.webservice.com'
    data = [{name: Faker::Name.name, age: Faker::Number.number(2) }]
    stub_request(:post, uri).to_return(:status => 200, :body => data.to_json, :headers => {})

    response = helper.get_json_from_uri(uri)
    expect(WebMock).to have_requested(:post, uri)
    expect(response).to eq data
  end
end