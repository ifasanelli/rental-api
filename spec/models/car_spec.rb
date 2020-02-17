require 'rails_helper'

describe Car do
  it 'should get all cars via API' do
    url = 'http://localhost:3000/api/v1/cars'
    json = File.read(Rails.root.join('spec/support/jsons/car_index.json'))
    response = double('faraday_response', body: json, status: 200)

    allow(Faraday).to receive(:get).with(url).and_return(response)
    allow_any_instance_of(Faraday)

    result = Car.all

    expect(result.length).to eq 2
    expect(result[0].license_plate).to eq 'ABC-1234'
    expect(result[1].license_plate).to eq 'DEF-5678'
  end
end
