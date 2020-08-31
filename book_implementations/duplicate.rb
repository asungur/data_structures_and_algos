def has_duplicate_value(array)
  temp_arr = array.sort

  temp_arr.each_with_index do |val, i|
    return true if temp_arr[i] == val
  end
end

# arr = [5, 9, 3, 2, 4, 5, 6]

# p has_duplicate_value(arr)