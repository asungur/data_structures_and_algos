# 3 pointer solution
# TIME 65%
# MEMO  95%

def three_sum(arr)
  arr.sort!

  triples = []

  (arr.length - 2).times do |i_a|

    i_b = i_a + 1
    i_c = arr.length - 1

    next if (i_a > 0 && (arr[i_a] == arr[i_a - 1]))

    while i_b < i_c
      sum = arr[i_a] + arr[i_b] + arr[i_c]

      if sum < 0
        i_b += 1
      elsif sum > 0
        i_c -= 1
      else
        triples << [arr[i_a], arr[i_b], arr[i_c]]
        while arr[i_b] == arr[i_b + 1]
          i_b += 1
        end
        while arr[i_c] == arr[i_c - 1]
          i_c -= 1
        end
        i_b += 1
        i_c -= 1
      end
    end    
  end
  triples
end


p three_sum([-1, 0, 1, 2, -1, -4])
