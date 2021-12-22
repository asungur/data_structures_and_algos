# Given a string s, return the longest palindromic substring in s.


# Example 1:

# Input: s = "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: s = "cbbd"
# Output: "bb"
# Example 3:

# Input: s = "a"
# Output: "a"
# Example 4:

# Input: s = "ac"
# Output: "a"


# EXPAND FROM CENTER
# SPEED 70%
# MEMO 75%
def longest_palindrome(str)
  return "" if !str || str.length < 1

  idx_start = 0
  idx_end = 0

  str.length.times do |i|
    even_pal_length = expand_from_index(str, i, i)
    odd_pal_length  = expand_from_index(str, i, i + 1)

    max_len = even_pal_length > odd_pal_length ? even_pal_length : odd_pal_length

    if (max_len > (idx_end - idx_start))
      idx_start = i - ((max_len - 1) / 2)
      idx_end   = i + (max_len / 2)
    end
  end
  str[idx_start..idx_end]
end

def expand_from_index(str, left, right)
  return 0 if !str || left > right

  while left >= 0 && right < str.length && (str[left] == str[right])
    left -= 1
    right += 1
  end
  right - left - 1
end


p longest_palindrome("babad")
p longest_palindrome("cbbd")
p longest_palindrome("a")
p longest_palindrome("ac")


# BRUTE FORCE (TOO SLOW)
# def longest_palindrome(string)
#   palindromes = []
#   head = 0
#   while head < string.length
#     tail = head
#     while tail < string.length
#       check_str = string[head..tail]
#       if check_str == check_str.reverse && !palindromes.include?(check_str)
#         palindromes << check_str 
#       end
#       tail += 1
#     end
#     head += 1
#   end
#   palindromes.sort{|a,b| b.length <=> a.length}[0]
# end