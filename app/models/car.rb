class Car
  attr_accessor :id, :license_plate, :color, :car_model, :mileage, :subsidiary, :status

  def initialize(id, license_plate, color, car_model, mileage, subsidiary, status)
    @id = id
    @license_plate = license_plate
    @color = color
    @car_model = car_model
    @mileage = mileage
    @subsidiary = subsidiary
    @status = status
  end


  def self.all
    request_url = 'http://localhost:3000/api/v1/cars'
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    result = []
    json.each do |item|
      result << Car.new(item[:id], item[:license_plate], item[:color], item[:car_model_id], item[:mileage], item[:subsidiary_id], item[:status])
    end

    result
  end

  def self.find(car_id)
    request_url = "http://localhost:3000/api/v1/cars/#{car_id}"
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    @car_category = Car.new(json[:id], json[:license_plate], json[:color], json[:car_model], json[:mileage], json[:subsidiary], json[:status])
  end


end