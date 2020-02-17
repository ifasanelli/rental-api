class Manufacturer
  attr_accessor :name, :id

  def initialize(id, name)
    @name = name
    @id = id
  end


  def self.all
    request_url = 'http://localhost:3000/api/v1/manufacturers'
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    result = []
    json.each do |item|
      result << Manufacturer.new(item[:id], item[:name])
    end

    result
  end

  def self.find(manufacturer_id)
    request_url = "http://localhost:3000/api/v1/manufacturers/#{manufacturer_id}"
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    @manufacturer = Manufacturer.new(json[:id], json[:name])
  end


end