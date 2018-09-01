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

  def test_ship_starts_with_no_coordinates
    ship = Ship.new("Cruiser", 3)

    assert_equal [], ship.coordinates
  end

  def test_destroyer_can_be_assigned_coordinates_horizontally
    ship = Ship.new("Destroyer", 2)

    expected = ['A1', 'A2']
    actual = ship.assign_coordinates('A1', 'A2')
    assert_equal expected, actual
  end

  def test_cruiser_can_be_assigned_coordinates_horizontally
    ship = Ship.new("Cruiser", 3)

    expected = ['A1', 'A2', 'A3']
    actual = ship.assign_coordinates('A1', 'A3')
    assert_equal expected, actual
  end

  def test_destroy_can_be_assigned_coordinates_vertically
    ship = Ship.new("Destroyer", 2)

    expected = ['A1', 'B1']
    actual = ship.assign_coordinates('A1', 'B1')
    assert_equal expected, actual
  end

  def test_cruiser_can_be_assigned_coordinates_vertically
    ship = Ship.new("Cruiser", 3)

    expected = ['A1', 'B1', 'C1']
    actual = ship.assign_coordinates('A1', 'C1')
    assert_equal expected, actual
  end

  def test_alpha_coordinates_changed_to_nums
    ship = Ship.new("Cruiser", 3)

    assert_equal 1, ship.num_coord('A')
    assert_equal 2, ship.num_coord('B')
    assert_equal 3, ship.num_coord('C')
    assert_equal 4, ship.num_coord('D')
  end

  def test_num_coordinates_changed_to_alpha
    ship = Ship.new("Cruiser", 3)

    assert_equal 'A', ship.alpha_coord(1)
    assert_equal 'B', ship.alpha_coord(2)
    assert_equal 'C', ship.alpha_coord(3)
    assert_equal 'D', ship.alpha_coord(4)
  end
end
