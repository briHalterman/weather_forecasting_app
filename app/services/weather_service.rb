# define a WeatherService class using Ruby's class syntax
class WeatherService
  # include the HTTParty module to make HTTP requests
  include HTTParty
  # set the base URI for the open-meteo.com API
  base_uri 'https://api.open-meteo.com/weather'

  # define a class method get_weather_forecast that takes latitude and longitude coordinates as parameters
  def self.get_weather_forecast(latitude, longitude)
    # make a GET request to the API endpoint corresponding to the provided coordinates
    response = get("/?latitude=#{latitude}&longitude=#{longitude}")
    # if the request is successful
    if response.success?
      # return the parsed response 
      return response.parsed_response
    # if the request fails
    else
      # Handle error
      # return nil
      return nil
    end
  end
end