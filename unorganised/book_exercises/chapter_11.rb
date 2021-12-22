# 1. Use recursion to write a function that accepts an array of strings and returns the total number of characters across all the strings. For example, if the input array is ["ab", "c", "def", "ghij"], the output should be 10 since there are 10 characters in total.

def total_chars(arr)
  return 0 if arr.length == 0
  
  arr[0].length + total_chars(arr[1..-1])
end

# p total_chars(["ab", "c", "def", "ghij"])


# 2. Use recursion to write a function that accepts an array of numbers and returns a new array containing just the even numbers.

def select_even(arr)
  return [] if arr.empty?

  if arr[0].even?
    return [arr[0]] + select_even(arr[1..-1])
  else
    return select_even(arr[1..-1])
  end
end

# p select_even([1, 4, 7, 9, 0, -2, 4])


# 3. There is a numerical sequence known as “Triangular Numbers.” The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward with the Nth number in the pattern, which is N plus the previous number. For example, the 7th number in the sequence is 28, since it’s 7 (which is N) plus 21 (the previous number in the sequence). Write a function that accepts a number for N and returns the correct number from the series. That is, if the function was passed the number 7, the function would return 28.

def triangle(n)
  return 1 if n == 1
  return n + triangle(n - 1)
end


# p triangle(7) 


# 4. Use recursion to write a function that accepts a string and returns the first index that contains the character “x.” For example, the string "abcdefghijklmnopqrstuvwxyz" has an “x” at index 23. To keep things simple assume the string definitely has at least one “x.”

def index_of_x(string)
  return 0 if string[0] == "x"

  return 1 + index_of_x(string[1..-1])
end

# p index_of_x("abcdefghijklmnopqrstuvwxyz")


# 5. This problem is known as the “Unique Paths” problem: Let’s say you havea grid of rows and columns. Write a function that accepts a number of rows and a number of columns, and calculates the number of possible “shortest” paths from the upper-leftmost square to the lower-rightmost square.


def unique_paths(rows, columns)
  return 1 if rows == 1 || columns == 1

  return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
end