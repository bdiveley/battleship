class Ship
    attr_reader :name,
                :length,
                :coordinates

  def initialize(name, length)
    @name = name
    @length = length
    @coordinates = []
  end

  def assign_coordinates(coord_1, coord_2)
    @coordinates << coord_1
    if coord_1.chars[-1].to_i + 1 == coord_2[-1].to_i ||
      num_coord(coord_1.chars[0]) + 1 == num_coord(coord_2.chars[0])
      @coordinates << coord_2
    elsif
      coord_1.chars[0] == coord_2.chars[0]
      @coordinates << coord_1[0] + (coord_1[-1].to_i + 1).to_s
      @coordinates << coord_2
    else
      @coordinates << alpha_coord(num_coord(coord_1[0]) + 1) + coord_1[-1]
      @coordinates << coord_2
    end
  end

  def num_coord(coord)
     if coord == "A"
       1
     elsif coord == "B"
       2
     elsif coord == "C"
       3
     elsif coord == 'D'
       4
     end
  end

  def alpha_coord(coord)
    if coord == 1
      "A"
    elsif coord == 2
      "B"
    elsif coord == 3
      "C"
    elsif coord == 4
      "D"
    end
  end

end
