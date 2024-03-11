class Location < ApplicationRecord
  # ensure that both the IP address and the text address are present before saving the location
  validates :ip_address, presence: true, format: { with: /\A(?:[0-9]{1,3}\.){3}[0-9]{1,3}\z/ } # alidate that the IP address is in a valid IPv4 format
  validates :text_address, presence: true
end