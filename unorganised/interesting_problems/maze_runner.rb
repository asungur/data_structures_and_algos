# require 'pry'
# MAZE RUNNER (AKA ROBOT IN A GRID)
# IMAGINE A ROBOT SITTING ON THE UPPER LEFT CORNER OF GRID WITH R ROWS AND C COLUMNS. THE ROBOT CAN ONLY MOVE IN TWO DIRECTIONS, RIGHT AND DOWN, BUT CERTAIN CELLS ARE OFF LIMITS SUCH THAT THE ROBOT CANNOT STEP ON THEM. DESIGN AN ALGORITHM TO FIND A PATH FOR THE ROBOT FROM THE TOP LEFT TO THE BOTTOM RIGHT 

# SOLUTION: START FROM THE END OF THE LABYRINTH AND CHECK CELLS RECURSIVELY AND SAVE THE PATH

matrix = [
  [ true, false,  true,  false, false ],
  [ true, false, true,  true, true ],
  [ true, true,  true,  false, true ],
  [ true, true,  true,  true,  true ],
  [ true, false, false, true, true ]
]

my_row = 4
my_column = 4


def robot_on_grid(matrix, row, column, path = [])


  return false if (row < 0 || column < 0 || !matrix[row][column])

  target_reached = (row == 0 && column == 0)



  if (target_reached || robot_on_grid(matrix, row - 1, column, path) ||
      robot_on_grid(matrix, row, column - 1, path))
    

    path << "row: #{row + 1}, column: #{column + 1}"

    # puts path

    return true
  end
  false
end

path_arr = []

result = robot_on_grid(matrix, my_row, my_column, path_arr)

p path_arr if !!result