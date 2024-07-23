def insertion_sort(arr):
    # Iterate over the array
    for i in range(1, len(arr)):
        temp = arr[i]
        position = i - 1
        
        # Iterate backwards from the position of the pointer
        while position >= 0:
            if arr[position] > temp:
                arr[position + 1] = arr[position]
                position =- 1
            else:
                break
        arr[position + 1] = temp
