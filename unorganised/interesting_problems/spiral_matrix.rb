# SPIRAL MATRIX
# Given an m x n matrix, return all elements of the matrix in spiral order.

# SMIMLAR BUT VERY SHORT USING RUBY'S TRANSPOSE:
# SPEED: 25%
# MEMO: 85%

def spiral_order(matrix)
  matrix == [] ? [] : matrix.shift + spiral_order(matrix.transpose.reverse)
end

# MY SOLUTION THAT KEEPS ROTATING THE MATRIX:
# SPEED: 10%
# MEMO: 20%

# def spiral_order(matrix)
#   spiral = []
#   copy_matrix = matrix.dup

#   while !copy_matrix.empty?
#     spiral << copy_matrix.shift
#     copy_matrix = clockwise_rotate(copy_matrix)
#   end
#   spiral.flatten
# end

# def clockwise_rotate(matrix)
#   return [] if matrix.empty?

#   rotated_matrix = []
#   cols = matrix[0].length
#   rows = matrix.length

#   cols.times do |i|
#     new_row = []
#     rows.times do |j|
#       new_row << matrix[j][i]
#     end
#     rotated_matrix.unshift(new_row)
#   end
#   rotated_matrix
# end



matrix_1 = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [1,2,3,6,9,8,7,4,5]

matrix_2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
# Output: [1,2,3,4,8,12,11,10,9,5,6,7]

matrix_3 = []
# Output: []

p spiral_order(matrix_3)