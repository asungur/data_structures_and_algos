# 1. Given an array of positive numbers, write a function that returns the greatest product of any three numbers. The approach of using three nested loops would clock in at O(N3), which is very slow. Use sorting to implement the function in a way that it computes at O(N log N) speed. (There are even faster implementations, but we’re focusing on using sorting as a technique to make code faster.)

def greatest_product_of_3(array)
  array.sort! { |a, b| b <=> a }

  array[0] * array[1] * array[2]
end

# 2. The following function finds the “missing number” from an array of integers. That is, the array is expected to have all integers from 0 up to the array’s length, but one is missing. As examples, the array, [5, 2, 4, 1, 0] is 
# missing the number 3, and the array, [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8.
# Here’s an implementation that is O(N2) (the includes method alone is already O(N), since the computer needs to search the entire array to find n):

# def findMissingNumber(array)
#   array.length.times do |i|
#     return i unless array.include?(i)
#   end

#   nil
# end

def find_missing_number(array)
  array.sort!

  array.each_with_index do |val, i|
    return i unless val == i
  end
  
  nil
end

# Use sorting to write a new implementation of this function that only takes O(N log N). (There are even faster implementations, but we’re focusing on using sorting as a technique to make code faster.)

# 3. Write three different implementations of a function that finds the greatest number within an array. Write one function that is O(N2), one that is O(N log N), and one that is O(N).

# O(N)
def max(arr)
  max = arr[0]

  arr.each { |val| max = val if val > max }
end

# O(N log N)
def max(arr)
  arr.sort! { |a, b| b <=> a }

  arr[0]
end

# O(N2)
def max(arr)
  arr.each do |val1|
    i_is_great = true
    arr.each do |val2|
      i_is_great = false
      i_is_great = true if val1 > val2
    end
    return val1 if i_is_great
  end
end
