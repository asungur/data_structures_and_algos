# Given a string s, find the length of the longest substring without repeating characters.

# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

# Example 4:
# Input: s = ""
# Output: 0
 

# SLIDING WINDOW SOLUTION
# SPEED 40%
# MEMO 30%

def length_of_longest_substring(str)
  p1 = 0
  p2 = 0
  max_len = 0
  chars_hash = {}

  while p2 < str.length
    if !chars_hash[str[p2]]
      chars_hash[str[p2]] = true
      p2 += 1
      max_len = [chars_hash.keys.length, max_len].max
    else
      chars_hash.delete(str[p1])
      p1 += 1
    end
  end
  max_len
end

p length_of_longest_substring("abcabc")
p length_of_longest_substring("bbbbb")
p length_of_longest_substring("pwwkew")
p length_of_longest_substring("")

