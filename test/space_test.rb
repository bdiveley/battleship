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

  def test_space_starts_with_no_ship
    space_1 = Space.new('A1')

    refute space_1.has_ship?
  end

  def test_can_add_ship_to_space_if_coords_match
    space = Space.new('A1')
    ship = Ship.new("Destroyer", 2)
    ship.assign_coordinates('A1', 'B2')
    space.add_ship(ship)

    assert space.has_ship?
  end

  def test_cannot_add_ship_to_space_if_coords_dont_match
    space = Space.new('A1')
    ship = Ship.new("Destroyer", 2)
    ship.assign_coordinates('B1', 'B2')
    space.add_ship(ship)

    assert space.has_ship?
  end

  def test_cannot_add_more_than_one_ship_to_same_space
    space = Space.new('A1')
    ship_1 = Ship.new("Destroyer", 2)
    ship_1.assign_coordinates('B1', 'B2')
    ship_2 = Ship.new("Cruiser", 3)
    ship_2.assign_coordinates('B2', 'B4')

    space.add_ship(ship_1)
    space.has_ship?

    assert_equal "Can't do that",     space.add_ship(ship_2)
  end

  def test_space_starts_with_no_peg
    space_1 = Space.new('A1')

    refute space_1.has_peg?
  end

  def test_can_add_peg_to_space_if_coords_match
    space = Space.new('A1')
    peg = Peg.new('A1')
    space.add_peg(peg)

    assert space.has_peg?
  end

  def test_cannot_add_peg_to_space_if_coords_dont_match
    space = Space.new('A1')
    peg = Peg.new('B1')
    space.add_peg(peg)

    refute space.has_peg?
  end

  def test_cannot_add_more_than_one_peg_to_same_space
    space = Space.new('A1')
    peg_1 = Peg.new('A1')
    peg_2 = Peg.new('A1')

    space.add_peg(peg_1)
    space.has_peg?

    assert_equal "Can't do that",     space.add_peg(peg_2)
  end

end
