# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"

# Write the code that will take a string and make this conversion given a number of rows:

# string convert(string s, int numRows);
 

# Example 1:

# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
# Example 2:

# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
# P     I    N
# A   L S  I G
# Y A   H R
# P     I
# Example 3:

# Input: s = "A", numRows = 1
# Output: "A"


# Iterate over the string depending on the recurring length, locate
# TIME %95
# MEMO %92

def convert(s, num_rows)
  return s if num_rows == 1

  n = s.length
  recurring = 2 * num_rows - 2
  rows = []
  num_rows.times { |_| rows << [] }

  n.times do |i|
    x = i % recurring
    if x < num_rows
      rows[x] << s[i]
    else
      rows[recurring - x] << s[i]
    end  
  end

  rows.map{ |row| row.join }.join
end



# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"

p convert("PAYPALISHIRING", 3)