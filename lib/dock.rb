require 'pry'
require './lib/'


class Dock 
  attr_reader :name,
              :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    
  end

  def log_hour
    @boat.hours_rented += 1
  end

  def rent(boat_type, renter_name)
    
  end
end