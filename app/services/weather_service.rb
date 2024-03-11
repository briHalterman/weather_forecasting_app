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
      handle_error(response)
      # return nil
      return nil
    end
    # catch any standard errors that might occur during the API request, such as network issues or timeouts
    rescue StandardError => e
      # Handle other errors like network issues, timeouts, etc.
      puts "Error occurred: #{e.message}"
      return nil
    end

  private

  def self.handle_error(response)
    case response.code
    when 400..499
      # Client-side error, such as invalid request
      puts "Client-side error: #{response.code}"
    when 500..599
      # Server-side error, such as server not reachable or internal server error
      puts "Server-side error: #{response.code}"
    else
      # Other unexpected errors
      puts "Unexpected error: #{response.code}"
    end
  end
end