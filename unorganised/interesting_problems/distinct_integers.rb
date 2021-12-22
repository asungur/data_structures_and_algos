# Given a set of distinct integers, nums, return all possible subsets (the power set).

# Note: The solution set must not contain duplicate subsets.

# Example:

# Input: nums = [1,2,3]
# Output:
# [
#   [3],
#   [1],
#   [2],
#   [1,2,3],
#   [1,3],
#   [2,3],
#   [1,2],
#   []
# ]

# MY SOLUTION
# SPEED: 45%
# MEMO: 60%

my_array = [1, 2, 3]
combinations = [[]]

def iterate_subsets(arr, original_arr, index, memo)

  return if index > original_arr.length - 1

  iterator = index
  while iterator < original_arr.length
    temp_arr = arr.dup

    subset = temp_arr << original_arr[iterator]
    memo << subset

    iterate_subsets(subset, original_arr, iterator + 1, memo)

    iterator += 1
  end
end

def subsets(nums)
  combinations = [[]]
  iterate_subsets([], nums, 0, combinations)

  combinations
end

p subsets(my_array)