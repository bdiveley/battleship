class Space
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @has_ship = false
    @has_peg = false
  end

  def has_ship?
      @has_ship
  end

  def add_ship(ship)
    if @has_ship == false
      if ship.coordinates.any? do |coord|
        coord == @coordinate
        @has_ship = true
        end
      end
    else
      "Can't do that"
    end
  end

  def has_peg?
      @has_peg
  end

  def add_peg(peg)
    if @has_peg == false && @coordinate == peg.guess
      @has_peg = true
    else
      "Can't do that"
    end
  end

end
