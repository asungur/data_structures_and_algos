def selection_sort(arr):
    size = len(arr)
    # Use a new array to avoid mutation
    sorted_arr = arr.copy() 
    
    for i in range(size):
        lowest_num_idx = i
        
        for j in range(i + 1, size):
            # Find and update the index of the smallest number.
            if sorted_arr[j] < sorted_arr[lowest_num_idx]:
                lowest_num_idx = j
        # Swap numbers
        sorted_arr[i], sorted_arr[lowest_num_idx] = sorted_arr[lowest_num_idx], sorted_arr[i]
    return sorted_arr


print(selection_sort([65, 55, 45, 35, 25, 15, 10]))