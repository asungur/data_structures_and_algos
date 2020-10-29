GRID_SIZE = 8
results = []
def eight_queens(row, columns = [] , results = [])
  if row == GRID_SIZE
    results << columns
  else
    GRID_SIZE.times do |column|
      if check_valid(columns, row, column)
        columns[row] = column
        eight_queens(row + 1, columns, results)
      end
    end
  end
end

def check_valid(columns, row1, column1)
  row1.times do |row2|
    column2 = columns[row2]

    return false if (column1 == column2)

    column_distance = (column2 - column1).abs

    row_distance = row1 - row2
    return false if column_distance == row_distance
  end
  true
end

eight_queens(0, results)

p results
