def bubble_sort(array)
  unsorted_until_index = array.length - 1
  sorted = false

  while !sorted
    sorted = true
    i = 0
    while i < unsorted_until_index
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
      i += 1
    end
    unsorted_until_index -= 1
  end
  array
end
