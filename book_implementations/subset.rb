def subset?(arr1, arr2)
  hash_table = {}
  larger_arr = []
  smaller_arr = []

  # DETERMINE THE SMALLER ARRAY
  if arr1.length > arr2.length
    larger_arr = arr1
    smaller_arr = arr2
  else
    larger_arr = arr2
    smaller_arr = arr1
  end

  # STORE ALL VALUES FROM LARGER ARRAY INSIDE HASH TABLE
  larger_arr.each { |val| hash_table[val] = true }

  # ITERATE THROUGH SMALLER ARR AND RETURN FALSE IF ANY VALUES DONT MATCH
  smaller_arr.each { |val| return false if !hash_table[val] }

  # IF THIS LINE OF CODE RUNS THIS MEANS ALL VALUES ARE MATCHING
  true
end
