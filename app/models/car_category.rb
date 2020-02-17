class CarCategory
  attr_accessor :id, :name, :daily_rate, :car_insurance, :third_party_insurance

  def initialize(id, name, daily_rate, car_insurance, third_party_insurance)
    @id = id
    @name = name
    @daily_rate = daily_rate
    @car_insurance = car_insurance
    @third_party_insurance = third_party_insurance
  end


  def self.all
    request_url = 'http://localhost:3000/api/v1/car_categories'
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    result = []
    json.each do |item|
      result << CarCategory.new(item[:id], item[:name], item[:daily_rate], item[:car_insurance], item[:third_party_insurance])
    end

    result
  end

  def self.find(car_category_id)
    request_url = "http://localhost:3000/api/v1/car_categories/#{car_category_id}"
    response = Faraday.get(request_url)

    return [] if response.status == 500

    json = JSON.parse(response.body, symbolize_names: true)

    @car_category = CarCategory.new(json[:id], json[:name], json[:daily_rate], json[:car_insurance], json[:third_party_insurance])
  end


end