# base case "a" => "a"
# "ab" => for each permuation of "a" add "b" before and after each character
#          "ba"  "ab"

# "abc" => for each permuation of "ab" add "c" before and after each character

#         "cba"   "bca"   "bac"   "cab" "acb" "abc"

def permutations(string)
  perms_arr = []

  # BASE CASE
  if string.length == 0
    perms_arr << string
    return perms_arr
  end

  first_char = string[0]
  remainder = string[1..-1]

  sub_str = permutations(remainder)
  # binding.pry
  sub_str.each do |str|
    iterations = str.length + 1
    iterations.times do |i|
      new_str = insert_char_at(str, first_char, i)

      perms_arr << new_str
    end
  end
  
  perms_arr
end


def insert_char_at(string, char, i)
  return char if string.length == 0

  new_str = ""

  string.split("").each_with_index do |c, j|
    if j == i
      new_str << char
    end
    new_str << c
  end

  new_str << char if i == string.length

  new_str
end

p permutations("abc")
