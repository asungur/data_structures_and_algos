def selection_sort(array)
  steps = 1;
  array.length.times do |i|
    lowest_num_idx = i
    (i + 1..array.length - 1).to_a.each do |j|
      steps += 1
      if (array[j] < array[lowest_num_idx])
        lowest_num_idx = j
      end
    end
    if lowest_num_idx != i
      temp = array[i]
      array[i] = array[lowest_num_idx]
      array[lowest_num_idx] = temp
    end
  end
  puts steps
  array
end
