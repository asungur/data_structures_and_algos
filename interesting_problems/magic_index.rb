test_arr = [ -40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13 ]

def magic_index(arr, start_idx, end_idx)
  return -1 if end_idx < start_idx

  mid = (start_idx + end_idx) / 2

  if (arr[mid] == mid)
    return mid
  elsif (arr[mid] > mid)
    return magic_index(arr, start_idx, mid - 1)
  else 
    return magic_index(arr, mid + 1, end_idx)
  end
end

# p magic_index(test_arr, 0, test_arr.length - 1)

def magic_index_not_distinct(arr, start_idx, end_idx)
  return -1 if end_idx < start_idx

  mid_idx = (start_idx + end_idx) / 2
  mid_value = arr[mid_idx]
  return mid_idx if mid_idx == mid_value

  left_idx = [mid_idx - 1, mid_value].min
  left_value = magic_index_not_distinct(arr, start_idx, left_idx)
  return left_value if left_value >= 0

  right_idx = [mid_idx + 1, mid_value].max
  right_value = magic_index_not_distinct(arr, right_idx, end_idx)
  return right_value

end

p magic_index_not_distinct(test_arr, 0, test_arr.length - 1)