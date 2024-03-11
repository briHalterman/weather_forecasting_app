# define the IpApiService class
class IpApiService
  # include the HTTParty module to make HTTP requests
  include HTTParty
  # set the base URI for the ipapi.co API
  base_uri 'https://ipapi.co'

  # define a class method get_coordinates that takes an ip_address as an argument
  def self.get_coordinates(ip_address)
    # make a GET request to the ipapi.co API with the provided IP address
    response = get("/#{ip_address}/json/")
    
    unless response.success?
      handle_api_error(response, ip_address)
      return nil
    end

    unless response.parsed_response['latitude'] && response.parsed_response['longitude']
      handle_missing_coordinates_error(ip_address)
      return nil
    end

    # extract the latitude and longitude coordinates from the response and return them as a hash
    return {
      latitude: response['latitude'],
      longitude: response['longitude']
    }

  rescue StandardError => e
    handle_unexpected_error(e, ip_address)
    nil
  end
  
  private

  def self.handle_api_error(response, ip_address)
    Rails.logger.error("Failed to fetch coordinates for IP address #{ip_address}: #{response.code} - #{response.message}")
  end

  def self.handle_missing_coordinates_error(ip_address)
    Rails.logger.error("Missing latitude or longitude in response for IP address #{ip_address}")
  end

  def self.handle_unexpected_error(error, ip_address)
    Rails.logger.error("An unexpected error occurred while fetching coordinates for IP address #{ip_address}: #{error.message}")
  end
end