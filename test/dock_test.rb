require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'
require './lib/dock'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3) 
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20) 
    @canoe = Boat.new(:canoe, 25) 
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_has_attributes
    assert_instance_of Dock, @dock
    assert_equal "The Rowing Dock", @dock.name
    assert_equal 3, @dock.max_rental_time
  end

  def test_dock_inventory_start_empty
    assert_equal({}, @dock.boat_inventory)
  end

  def test_adding_to_inventory
    @dock.add_to_inventory(@kayak_1.type, @kayak_1.price_per_hour)
    assert :kayak, @dock.boat_inventory.keys
  end

  def test_add_multiple_boats_to_inventory
    @dock.add_to_inventory(@kayak_1.type, @kayak_1.price_per_hour) 
    @dock.add_to_inventory(@canoe.type, @canoe.price_per_hour)
    @dock.add_to_inventory(@sup_1.type, @sup_1.price_per_hour)
    assert_equal 3, @dock.boat_inventory.keys.length
  end

  def test_rent_to_first_customer
    skip
   @dock.add_to_inventory(@kayak_1.type, @kayak_1.price_per_hour) 
   @dock.add_to_inventory(@canoe.type, @canoe.price_per_hour)
   @dock.add_to_inventory(@sup_1.type, @sup_1.price_per_hour)

   @dock.rent(@kayak_1, @patrick)
   @dock.rent(@kayak_2, @patrick)
   @dock.log_hour
   @dock.rent(@canoe, @patrick)
   @dock.log_hour
   @dock.return(@kayak_1)
   @dock.return(@kayak_2)
   @dock.return(@canoe)
   assert_equal 105, @dock.revenue
  end
end