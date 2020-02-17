class CarModel
  attr_accessor :id, :name, :year, :motorization, :fuel_type, :manufacturer_id, :car_category_id

  def initialize(id, name, year, motorization, fuel_type, manufacturer_id, car_category_id)
    @id = id
    @name= name
    @year = year
    @motorization = motorization
    @fuel_type = fuel_type
    @manufacturer_id = manufacturer_id
    @car_category_id = car_category_id
  end


  def self.all
    request_url = 'http://localhost:3000/api/v1/car_models'
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    result = []
    json.each do |item|
      result << CarModel.new(item[:id], item[:name], item[:year], item[:motorization], item[:fuel_type], item[:manufacturer_id], item[:car_category_id])
    end

    result
  end

  def self.find(car_model_id)
    request_url = "http://localhost:3000/api/v1/car_models/#{car_model_id}"
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    @car_model = CarModel.new(json[:id], json[:name], json[:year], json[:motorization], json[:fuel_type], json[:manufacturer_id], json[:car_category_id])
  end

end