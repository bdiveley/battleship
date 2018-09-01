class Space
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def has_ship?(ship)
    ship.coordinates.any? do |coord|
      coord == @coordinate
    end
  end

end
