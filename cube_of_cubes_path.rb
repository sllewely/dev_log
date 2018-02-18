# given a cube composed of lit and unlit cubes,
# find the longest path of adjacent (no diagonals) lit cubes
# The paths can snake in any direction, not just 1 row

class Cube

  def initialize(cube)
    @cube = cube
  end

  def find_path

  end

  def find_longest_path
    # find a starting point
    cube = @cube
    color_cube(cube, x, y, z)
  end

  def color_cube(cube, x, y, z)

  end
end

# true is a lit aka valid path
cube = [[[true, true, false, false, false], [true, false, false, false false], [true, false, false, false, true], [true, true, false, false, true], [false, true, false, false, false]],
    []]



