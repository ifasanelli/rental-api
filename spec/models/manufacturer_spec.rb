require 'rails_helper'

describe Manufacturer do
  it 'should get all manufacturers via API' do
    url = 'http://localhost:3000/api/v1/manufacturers'
    json = File.read(Rails.root.join('spec/support/jsons/manufacturer_index.json'))
    response = double('faraday_response', body: json, status: 200)

    allow(Faraday).to receive(:get).with(url).and_return(response)
    allow_any_instance_of(Faraday)

    result = Manufacturer.all

    expect(result.length).to eq 3
    expect(result[0].name).to eq 'Ford'
    expect(result[1].name).to eq 'Volvo'
    expect(result[2].name).to eq 'BMW'
  end
end
