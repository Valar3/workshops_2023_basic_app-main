class WeatherApiConnector
  API_KEY = A9n.weather_api_key
  LOCATION = 'Cracow'

  def weather_data
    url = "http://api.weatherapi.com/v1/current.json?key=#{A9n.weather_api_key}&q=#{LOCATION}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
