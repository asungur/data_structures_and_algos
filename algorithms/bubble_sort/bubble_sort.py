def bubble_sort(arr):
    bound = len(arr) - 1
    sorted = False
    
    while not sorted:
        sorted = True
        for i in range(bound):
            if arr[i] > arr[i+1]:
                arr[i], arr[i+1] = arr[i+1], arr[i]
                # If we do one modification, this means the array is not sorted
                sorted = False
        # Reduce the bound one step
        bound -= 1
    
    return arr

print(bubble_sort([65, 55, 45, 35, 25, 15, 10]))
