# 1. Write a function that returns the intersection of two arrays. The intersection is a third array that contains all values contained within the first two arrays. For example, the intersection of [1, 2, 3, 4, 5] and [0, 2, 4, 6, 8] is [2, 4]. Your function should have a complexity of O(N). (If your programming language has a built-in way of doing this, don’t use it. The idea is to build the algorithm yourself.)

def get_intersection(array1, array2)
  intersection = []
  hash_table = {}

  array1.each { |value| hash_table[value] = true }

  array2.each do |value|
    if hash_table[value]
      intersection << value
    end
  end

  intersection
end

# p intersect([1, 2, 3, 4, 5], [0, 2, 4, 6, 8])

# 2. Write a function that accepts an array of strings and returns the first duplicate value it finds. For example, if the array is ["a", "b", "c", "d", "c", "e", "f"], the function should return "c", since it’s duplicated within the array. (You can assume that there’s one pair of duplicates within the array.) Make sure the function has an efficiency of O(N).

def find_duplicate(str_arr)
  hash_table = {}

  str_arr.each do |val|
    if hash_table[val]
       return val
    else
      hash_table[val] = true
    end
  end
  nil
end

# p find_duplicate(["a", "b", "c", "d", "c", "e", "f"])


# 3. Write a function that accepts a string that contains all the letters of the alphabet except one and returns the missing letter. For example, the string, "the quick brown box jumps over a lazy dog" contains all the letters of the alphabet except the letter, "f". The function should have a time complexity of O(N).

def missing_letter(str)
  lookup_table = {}
  ('a'..'z').to_a.each { |letter| lookup_table[letter] = true }

  str.each_char { |c| return c if !lookup_table[c] }

  nil
end

# 4. Write a function that returns the first non-duplicated character in a string. For example, the string, "minimum" has two characters that only exist once—the "n" and the "u", so your function should return the "n", since it occurs first. The function should have an efficiency of O(N).

def first_non_duplicate(string)
  hash_table = {}

  string.each_char do |char|
    if hash_table[char]
      hash_table[char] += 1
    else
      hash_table[char] = 1
    end
  end

  string.each_char do |char|
    if hash_table[char] == 1
      return char
    end
  end

  return nil
end