require 'rails_helper'

describe CarModel do
  it 'should get all car models via API' do
    url = 'http://localhost:3000/api/v1/car_models'
    json = File.read(Rails.root.join('spec/support/jsons/car_model_index.json'))
    response = double('faraday_response', body: json, status: 200)

    allow(Faraday).to receive(:get).with(url).and_return(response)
    allow_any_instance_of(Faraday)

    result = CarModel.all

    expect(result.length).to eq 2
    expect(result[0].name).to eq 'Ka'
    expect(result[1].name).to eq 'Fiesta'
  end
end
