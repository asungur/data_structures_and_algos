# Given a string s, find the longest palindromic subsequence's length in s. You may assume that the maximum length of s is 1000.

# "bbbab" => "bbbb" => 4(output)




# DYNAMIC PROBLEM SOLUTION, STILL NOT SO FAST
# TIME 15%
# MEMO 10%
def longest_palindrome_subseq(str)
  n = str.length
  matrix = []

  # empty matrix
  n.times do |i|
    matrix[i] = []
    n.times do |j|
      matrix[i][j] = 0
    end
  end

  # single char palindromes
  n.times {|i| matrix[i][i] = 1}

  # Build the table(do not build the lower half)
  (2..n).each do |seq_len|
    (0..(n - seq_len)).each do |i_start|
      i_end = (i_start + seq_len - 1)
      if (str[i_start] == str[i_end])
        matrix[i_start][i_end] = 2 + (seq_len == 2 ? 0 : matrix[i_start + 1][i_end - 1])
      else
        matrix[i_start][i_end] = [matrix[i_start + 1][i_end], matrix[i_start][i_end - 1]].max
      end
    end
  end
  matrix[0][n - 1]
end


p longest_palindrome_subseq("agbdda")


# RECURSIVE SOLUTION, A LOT OF OVERLAPPING SUBPROBLEMS
# TIME LIMIT EXCEEDED
# def longest_palindrome_subseq(str)
#   n = str.length

#   lps_seq(str, 0, n - 1)
# end

# def lps_seq(str, i, j)
#   return 1 if (i==j)
#   return 2 if (str[i] == str[j] && (i + 1 == j))

#   return (lps_seq(str, i + 1, j - 1) + 2) if (str[i] == str[j])

#   return [lps_seq(str, i, j - 1), lps_seq(str, i + 1, j)].max
# end

