class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  
  geocoded_by :address 
  after_validation :geocode  
	
  reverse_geocoded_by :latitude, :longitude
  before_validation :reverse_geocode_if_address_blank 

  def reverse_geocode_if_address_blank
    if self.address.blank?
      self.reverse_geocode
    end
  end
end
