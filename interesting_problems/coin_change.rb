# COIN CHANGE PROBLEM
# N = 10
# COINS = [8, 2]
# COINS = [1, 5]

coins = [1, 2, 3]
total = 5
size = coins.length



def coin_change(coins, total, size)

  return 1 if total == 0
  return 0 if total < 0

  return 0 if (size <= 0 && total >=1 )

  return coin_change(coins, total, size - 1) + coin_change(coins, total - coins[size - 1], size)
end


puts coin_change(coins, total, size)

def coin_change_dp(total, coins)
  # Create ways array
  ways = [0] * (total + 1)
  ways[0] = 1;

  coins.each_with_index do |coin, i|

    ways.each_with_index do |way, j|
      if coin <= j

        ways[j] += ways[j - coin]
      end
    end
  end
  ways[-1]
end

puts coin_change_dp(total, coins)