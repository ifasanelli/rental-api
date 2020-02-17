require 'rails_helper'

describe CarCategory do
  it 'should get all car_categories via API' do
    url = 'http://localhost:3000/api/v1/car_categories'
    json = File.read(Rails.root.join('spec/support/jsons/car_category_index.json'))
    response = double('faraday_response', body: json, status: 200)

    allow(Faraday).to receive(:get).with(url).and_return(response)
    allow_any_instance_of(Faraday)

    result = CarCategory.all

    expect(result.length).to eq 3
    expect(result[0].name).to eq 'A'
    expect(result[1].name).to eq 'AA'
    expect(result[2].name).to eq 'AAA'
  end
end
