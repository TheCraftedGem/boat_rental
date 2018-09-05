require 'pry'
require './lib/boat'


class Dock 
  attr_reader :name,
              :max_rental_time,
              :boat_type,
              :boat_inventory
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boat_inventory = {} 
    
  end

  def add_to_inventory(boat_name, hourly)
    @boat_inventory[boat_name] = hourly
  end
  # def log_hour
  #  @boat_type
  #  binding.pry
  # end

  # def rent(boat_type, renter_name)
  #   until boat_type.hours_rented == 5 || self.return(boat_type)
  #     boat_type.add_hour 
  #     if self.log_hour
  #     end 
  #   end
  # end

  # def return(boat_type)
  
  # end

  # def revenue

  # end
end