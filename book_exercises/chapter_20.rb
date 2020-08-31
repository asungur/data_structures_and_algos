# 1. You’re working on software that analyzes sports players. Following are two arrays of players of different sports:
basketball_players = [
{first_name: "Jill", last_name: "Huang", team: "Gators"},
{first_name: "Janko", last_name: "Barton", team: "Sharks"},
{first_name: "Wanda", last_name: "Vakulskas", team: "Sharks"},
{first_name: "Jill", last_name: "Moloney", team: "Gators"},
{first_name: "Luuk", last_name: "Watkins", team: "Gators"}
]
football_players = [
{first_name: "Hanzla", last_name: "Radosti", team: "32ers"},
{first_name: "Tina", last_name: "Watkins", team: "Barleycorns"},
{first_name: "Alex", last_name: "Patel", team: "32ers"},
{first_name: "Jill", last_name: "Huang", team: "Barleycorns"},
{first_name: "Wanda", last_name: "Vakulskas", team: "Barleycorns"}
]

def find_multisport_athletes(arr1, arr2)
  multisport_athletes = []
  hash_table = {}

  arr1.each { |athlete| hash_table[athlete[:first_name] + " " + athlete[:last_name]] = true }

  arr2.each do |athlete|
    name = athlete[:first_name] + " " + athlete[:last_name]

    multisport_athletes << name if hash_table[name]
  end
  multisport_athletes
end

# p find_multisport_athletes(basketball_players, football_players)

# If you look carefully, you’ll see that there are some players who participate in more than one kind of sport. Jill Huang and Wanda Vakulskas play both basketball and football.
# You are to write a function that accepts two arrays of players and returns an array of the players who play in both sports. In this case, that would be:
# ["Jill Huang", "Wanda Vakulskas"]
# While there are players who share first names and players who share last names, we can assume there’s only one person who has a particular full name (meaning first and last name).
# We can use a nested-loops approach, comparing each player from one array against each player from the other array, but this would have a runtime of O(N * M). Your job is to optimize the function so that it can run in just O(N + M).

# 2. You’re writing a function that accepts an array of distinct integers from 0, 1, 2, 3…up to N. However, the array will be missing one integer, and your function is to return the missing one. For example, this array has all the integers from 0 to 6, but is missing the 4:
# [2, 3, 0, 6, 1, 5]
# Therefore, the function should return 4. The next example has all the integers from 0 to 9, but is missing the 1:
# [8, 2, 3, 9, 4, 7, 5, 0, 6]
# In this case, the function should return the 1. Using a nested-loops approach would take up to O(N2). Your job is to optimize the code so that it has a runtime of O(N).

def find_missing_number(array)
  # Calculate the full sum (which is the sum if only the 0 were missing):
  full_sum = 0
  (1..array.length).each do |n|
    full_sum += n
  end

  # Calculate the CURRENT sum:
  current_sum = 0

  array.each do |n|
    current_sum += n
  end
  # The difference between the two sums will be the missing number:
  return full_sum - current_sum
end


# 3. You’re working on some more stock-prediction software. The function you’re writing accepts an array of predicted prices for a particular stock over the course of time. For example, this array of seven prices: [10, 7, 5, 8, 11, 2, 6] predicts that a given stock will have these prices over the next seven days. (On Day 1, the stock will close at $10; on Day 2, the stock will close at $7; and so on.) Your function should calculate the greatest profit that could be made from a single “buy” transaction followed by a single “sell” transaction. In the previous example, the most money could be made if we bought the stock when it was worth $5 and sold it when it was worth $11. This yields a profit of $6 per share. Note that we could make even more money if we buy and sell multiple times, but for now, this function focuses on the most profit that could be made from just one purchase followed by one sale. Now, we could use nested loops to find the profit of every possible buyand-sell combination. However, this would be O(N2) and too slow for our hotshot trading platform. Your job is to optimize the code so that the function clocks in at just O(N).

predicted_prices = [10, 7, 5, 8, 11, 2, 6]

# MAX BUY-SELL profit  => 5 - 11 (6$)

def find_greatest_profit(array)
  max_profit = 0
  current_min = Float::INFINITY

  array.each do |price|
    current_min = price if price < current_min

    current_profit = price - current_min

    max_profit = current_profit if current_profit > max_profit
  end

  max_profit
end

# p find_greatest_profit(predicted_prices)

=begin
BOOK SOLUTION

def find_greatest_profit(array)
  buy_price = array[0]
  greatest_profit = 0

  array.each do |price|
    potential_profit = price - buy_price

    if price < buy_price
      buy_price = price
    elsif potential_profit > greatest_profit
      greatest_profit = potential_profit
    end
  end

  return greatest_profit
end

=end

# 4. You’re writing a function that accepts an array of numbers and computes the highest product of any two numbers in the array. At first glance, this is easy, as we can just find the two greatest numbers and multiply them. However, our array can contain negative numbers and look like this:
# [5, -10, -6, 9, 4] In this case, it’s actually the product of the two lowest numbers, -10 and
# -6 that yield the highest product of 60. We could use nested loops to multiply every possible pair of numbers, but this would take O(N2) time. Your job is to optimize the function so that it’s a speedy O(N).

def greatest_product(array)
  largest_positive = 0
  second_largest_positive = 0

  smallest_negative = 0
  second_smallest_negative = 0

  array.each do |num|

    if num >= 0
      if num > largest_positive
        second_largest_positive = largest_positive
        largest_positive = num
      elsif num > second_largest_positive
        second_largest_positive = num
      end
    else
      if num < smallest_negative
        second_smallest_negative = smallest_negative
        smallest_negative = num
      elsif num < second_smallest_negative
        second_smallest_negative = num
      end
    end
  end
    negative_product = smallest_negative * second_smallest_negative

    positive_product = largest_positive * second_largest_positive

    positive_product > negative_product ? positive_product : negative_product
end

set_1 = [5, -10, -6, 9, 4]
set_2 = [2, 20, -3, 0, -5]

# p greatest_product(set_1)
# p greatest_product(set_2)

# 5. You’re creating software that analyzes the data of body temperature readings taken from hundreds of human patients. These readings are taken from healthy people and range from 97.0 degrees Fahrenheit to 99.0 degrees Fahrenheit. An important point: within this application, the decimal point never goes beyond the tenths place. Here’s a sample array of temperature readings:
# [98.6, 98.0, 97.1, 99.0, 98.9, 97.8, 98.5, 98.2, 98.0, 97.1]
# You are to write a function that sorts these readings from lowest to highest. If you used a classic sorting algorithm such as Quicksort, this would take O(N log N). However, in this case, it’s actually possible to write a faster sorting algorithm. Yes, that’s right. Even though you’ve learned that the fastest sorts are O(N log N), this case is different. Why? In this case, there’s a limited number of possibilities of what the readings will be. In such a case, we can sort these values in O(N). It may be N multiplied by a constant, but that’s still considered O(N).

def sort_temperatures(array)
  hash_table = {}

  # Populate hash table with occurrences of temperatures:
  array.each do |temperature|
    if hash_table[temperature]
      hash_table[temperature] += 1
    else
      hash_table[temperature] = 1
    end
  end

  sorted_array = []

  # We multiply the temperature by 10 on the outset
  # so that we can increment the temperature by a whole number
  # during the loop, and avoid floating-point math errors: 
  temperature = 970

  # Run loop from 970 up to 990
  while temperature <= 990

    # If the hash table contains our the current temperature:
    if hash_table[temperature / 10.0]

      # Populate the sorted_array with as many occurences
      # of the current temperature that there are:
      hash_table[temperature / 10.0].times do
        sorted_array << temperature / 10.0
      end
    end

    temperature += 1
  end

  return sorted_array
end

# 6. You’re writing a function that accepts an array of unsorted integers and returns the length of the longest consecutive sequence among them. The sequence is formed by integers that increase by 1. For example, in the array:
# [10, 5, 12, 3, 55, 30, 4, 11, 2]
# the longest consecutive sequence is 2-3-4-5. These four integers form an increasing sequence because each integer is one greater than the previous one. While there’s also a sequence of 10-11-12, it’s only a sequence of three integers. In this case, the function should return 4, since that’s the length of the longest consecutive sequence that can be formed from this array.
# One more example:
# [19, 13, 15, 12, 18, 14, 17, 11]
# This array’s longest sequence is 11-12-13-14-15, so the function would return 5. If we sorted the array, we can then traverse the array just once to find the longest consecutive sequence. However, the sorting itself would take O(N log N). Your job is to optimize the function so that it takes O(N) time.


def longest_sequence_length(array)
  hash_table = {}
  greatest_sequence_length = 0

  array.each { |num| hash_table[num] = true }

  array.each do |num|

    unless hash_table[num - 1]

      current_sequence_length = 1

      # Run a while loop as long as there is a next number in the array
      current_number = num

      while hash_table[current_number + 1]
        current_number += 1
        current_sequence_length += 1

        if current_sequence_length > greatest_sequence_length
          greatest_sequence_length = current_sequence_length
        end
      end
    end
  end
  greatest_sequence_length
end

case_1 = [10, 5, 12, 3, 55, 30, 4, 11, 2]
case_2 = [19, 13, 15, 12, 18, 14, 17, 11]

p longest_sequence_length(case_1) # => 4
p longest_sequence_length(case_2) # => 5