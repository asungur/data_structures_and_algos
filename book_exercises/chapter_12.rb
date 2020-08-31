# 1. The following function accepts an array of numbers and returns the sum, as long as a particular number doesn’t bring the sum above 100. If adding a particular number will make the sum higher than 100, that number is ignored. However, this function makes unnecessary recursive calls. Fix the code to eliminate the unnecessary recursion:


def add_until_100(array)
  return 0 if array.length == 0
  sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])
  
  if array[0] + sum_of_remaining_numbers > 100
    return sum_of_remaining_numbers
  else
    return array[0] + sum_of_remaining_numbers
  end
end


# 2. The following function uses recursion to calculate the Nth number from a mathematical sequence known as the “Golomb sequence.” It’s terribly inefficient, though! Use memoization to optimize it. (You don’t have to actually understand how the Golomb sequence works to do this exercise.)

def golomb(n, memo={})
  return 1 if n == 1

  if !memo[n]
    memo[n] = 1 + golomb(n - golomb(golomb(n - 1, memo), memo), memo)
  end
  
  return memo[n]
end

# 3. Here is a solution to the “Unique Paths” problem from an exercise in the previous chapter. Use memoization to improve its efficiency:

# def unique_paths(rows, columns)
#   return 1 if rows == 1 || columns == 1
#   return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
# end

def unique_paths(rows, columns, memo={})
  return 1 if rows == 1 || columns == 1
  if !memo[[rows, columns]]
    memo[[rows, columns]] = unique_paths(rows - 1, columns, memo) + 
    unique_paths(rows, columns - 1, memo)
  end
  return memo[[rows, columns]]
end