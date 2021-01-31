# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# Example 1:

# Input: x = 123
# Output: 321
# Example 2:

# Input: x = -123
# Output: -321
# Example 3:

# Input: x = 120
# Output: 21
# Example 4:

# Input: x = 0
# Output: 0

p reverse(123) == 321
p reverse(-123) == -321
p reverse(120) == 21
p reverse(0) == 0



# MY IMPLEMENTATION:
# FASTER THAN 5%
# MEMORY LESS THAN 20%
def reverse(x)
  range = ((-2 ** 31)..(2 ** 31 - 1))
  positive = x >= 0 ? 1 : -1
  num_str = x.abs.to_s.split('')
  reversed_str = ''
  num_str.length.times {|_| reversed_str << num_str.pop}
  result = reversed_str.to_i * positive
  range.include?(result) ? result : 0
end

# FASTER IMPLEMENTATION WITHOUT STRING METHODS
# FASTER THAN 95%
# MEMORY LESS THAN 100%

def reverse(x)
  max = 2 ** 31 - 1
  min = -2 ** 31

  neg = x.negative?
  x *= -1 if neg    

  rev = 0
  while x != 0
      pop = x.remainder(10)
      x /= 10
      rev = rev * 10 + pop
  end
  
  return 0 if rev < min || max < rev
  
  neg ? rev * -1 : rev
end