require './test/test_helper.rb'

class SpaceTest < Minitest::Test

  def test_instance_exists
    space = Space.new('A1')

    assert_instance_of Space, space
  end

  def test_instance_variables_available
    space = Space.new('A1')

    assert_equal 'A1', space.coordinate
  end

  def test_space_has_a_ship?
    space_1 = Space.new('A1')
    space_2 = Space.new('A2')
    ship = Ship.new("Destroyer", 2)
    ship.assign_coordinates('A1', 'A2')

    assert space_1.has_ship?(ship)
    assert space_2.has_ship?(ship)
  end

  def test_space_has_no_ship?
    space = Space.new('A1')
    ship = Ship.new("Destroyer", 2)
    ship.assign_coordinates('A2', 'B2')

    refute space.has_ship?(ship)
  end

end
