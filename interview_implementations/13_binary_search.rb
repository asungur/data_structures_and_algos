def binary_search(ordered_arr, value)
  lower_bound = 0
  upper_bound = ordered_arr.length - 1

  while lower_bound <= upper_bound do
    mid_point = (upper_bound + lower_bound) / 2

    value_at_midpoint = ordered_arr[mid_point]

    if value == value_at_midpoint
      return mid_point
    elsif value < value_at_midpoint
      upper_bound = mid_point - 1
    elsif value > value_at_midpoint
      lower_bound = mid_point + 1
    end
  end

  nil
end
