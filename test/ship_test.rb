require './test/test_helper.rb'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def test_new_ship_exists
    ship = Ship.new("Destroyer", 2)

    assert_instance_of Ship, ship
  end

  def test_instance_variables
    ship = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", ship.name
    assert_equal 3, ship.length
  end

end
