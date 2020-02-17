class Subsidiary
  attr_accessor :id, :name, :cnpj, :address

  def initialize(id, name, cnpj, address)
    @id = id
    @name = name
    @cnpj = cnpj
    @address = address
  end


  def self.all
    request_url = 'http://localhost:3000/api/v1/subsidiaries'
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    result = []
    json.each do |item|
      result << Subsidiary.new(item[:id], item[:name], item[:cnpj], item[:address])
    end

    result
  end

  def self.find(subsidiary_id)
    request_url = "http://localhost:3000/api/v1/subsidiaries/#{subsidiary_id}"
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    @subsidiary = Subsidiary.new(json[:id], json[:name], json[:cnpj], json[:address])
  end


end