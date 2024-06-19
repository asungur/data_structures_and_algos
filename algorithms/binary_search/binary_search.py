def binary_search(arr, num):
    start, end = 0, (len(arr) -1)
    
    while start <= end:
        mid = int((end + start) / 2)
        mid_num = arr[mid]
        if mid_num == num:
            return mid
        elif num > mid_num:
            # +1 Cause this portion is already searched and prevent out-of-bounds errors
            start = mid + 1
        else:
            # -1 Cause this portion is already searched and prevent out-of-bounds errors
            end = mid - 1
    
    return -1

arr1 = [1, 2, 3, 4, 5, 6, 7]
arr2 = [1, 2, 3, 4, 5, 6]
arr3 = []

print(binary_search(arr1, 4)) # 3
print(binary_search(arr1, 6)) # 5
print(binary_search(arr1, 2)) # 1
print(binary_search(arr2, 4)) # 3
print(binary_search(arr2, 3)) # 2
print(binary_search(arr2, 9)) # -1
print(binary_search(arr3, 5)) # -1
