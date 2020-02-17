require 'rails_helper'

describe Subsidiary do
  it 'should get all subsidiaries via API' do
    url = 'http://localhost:3000/api/v1/subsidiaries'
    json = File.read(Rails.root.join('spec/support/jsons/subsidiary_index.json'))
    response = double('faraday_response', body: json, status: 200)

    allow(Faraday).to receive(:get).with(url).and_return(response)
    allow_any_instance_of(Faraday)

    result = Subsidiary.all

    expect(result.length).to eq 3
    expect(result[0].name).to eq 'Filial Santos'
    expect(result[0].cnpj).to eq '09343591000174'
    expect(result[0].address).to eq 'Rua de Santos, 13'

    expect(result[1].name).to eq 'Filial Ipiranga'
    expect(result[1].cnpj).to eq '41250389000100'
    expect(result[1].address).to eq 'Rua do Ipiranga, 11'

    expect(result[2].name).to eq 'Filial Maresias'
    expect(result[2].cnpj).to eq '91392669000121'
    expect(result[2].address).to eq 'Rua de Maresias, 12'
  end
end
