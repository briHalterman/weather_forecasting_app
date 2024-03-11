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
    if response.success?
      # extract the latitude and longitude coordinates from the response and return them as a hash
      return {
        latitude: response['latitude'],
        longitude: response['longitude']
      }
    else
      # Handle error
      return nil
    end
  end
end