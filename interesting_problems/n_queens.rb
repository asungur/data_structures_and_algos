GRID_SIZE = 4
board = [
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]  
]


def square_free?(board, idx_col, idx_row)

  # Check the same row
  idx_col.times do |col|
    return false if board[idx_row][col] == 1
  end

  # Check up-left diagonal
  col_iterator = idx_col - 1
  row_iterator = idx_row - 1
  while col_iterator >= 0 && row_iterator >= 0
    return false if board[row_iterator][col_iterator] == 1
    col_iterator -= 1
    row_iterator -= 1
  end

  # Check down-left diagonal
  col_iterator = idx_col - 1
  row_iterator = idx_row + 1
  while col_iterator >= 0 && row_iterator < GRID_SIZE
    return false if board[row_iterator][col_iterator] == 1
    col_iterator -= 1
    row_iterator += 1
  end

  true
end

def n_queens(board, idx_col = 0)
  if idx_col == GRID_SIZE
    print_results(board)
    return true
  end
  
  result = false

  GRID_SIZE.times do |idx_row|
    if square_free?(board, idx_col, idx_row)
      board[idx_row][idx_col] = 1

      result = n_queens(board, idx_col + 1) or result

      board[idx_row][idx_col] = 0
    end
  end
  return result
end

def print_results(result)
  puts "--------------------"
  result.each { |row| p row }
  puts "--------------------"
end

n_queens(board, 0)
