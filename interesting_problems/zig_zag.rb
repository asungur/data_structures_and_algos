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