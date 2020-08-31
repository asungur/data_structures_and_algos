def linear_search(array, value)
  array.each_with_index do |el, i|
    if el == value
      return i
    end
  end
  nil
end

def linear_search_ordered(ordered_arr, value)
  array.each_with_index do |el, i|
    if el == value
      return i
    elsif el > value
      break
    end
  end
  nil
end