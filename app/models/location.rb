class Location < ApplicationRecord
  # Ensure that both the IP address and the text address are present before saving the location
  validates :ip_address, presence: true, format: { with: /\A(?:[0-9]{1,3}\.){3}[0-9]{1,3}\z/ } # Validate that the IP address is in a valid IPv4 format
  validates :text_address, presence: true

  # Include Geocoder module
  geocoded_by :full_address

  # Callback to geocode after validation
  after_validation :geocode, if: :address_changed?

  # Define a method that returns the full address
  def full_address
    [street, city, state, country].compact.join(', ') # concatenate the address components
  end
end