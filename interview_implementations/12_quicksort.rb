def quicksort(arr, left_idx, right_idx)
  # Gives us the new location to partition
  index = partition(arr, left_idx, right_idx)

  if left_idx < index - 1
    # Sort left half
    quicksort(arr, left_idx, index - 1)
  end
  if index < right_idx
    quicksort(arr, index, right_idx)
  end
end


def partition(arr, left_idx, right_idx)
  # Pick pivot point
  pivot = arr[left_idx + (right_idx - left_idx) / 2]

  while left_idx < right_idx
    while arr[left_idx] < pivot
      left_idx += 1
    end
    while arr[right_idx] > pivot
      right_idx -= 1
    end
    # We now iterated until the elements that need to be swapped
    if left_idx <= right_idx
      arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
      left_idx += 1
      right_idx -= 1
    end
  end
  left_idx
end

arr = [ 0, 5, 2, 1, 6, 3]

quicksort(arr, 0, 5)

p arr