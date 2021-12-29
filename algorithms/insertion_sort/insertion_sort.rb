def insertion_sort(array)
  (array.length - 1).times do |i|
    temp_value = array[i + 1]
    position = i

    while position >= 0
      if array[position] > temp_value
        array[position + 1] = array[position]
        position = position - 1
      else
        break
      end
    end
    array[position + 1] = temp_value
  end
  array
end
