class SortableArray:
    def __init__(self, array):
        self.array = array

    def partition(self, left, right):
        # We always choose the right-most element as the pivot.
        # We keep the index of the pivot for later use:
        pivot_index = right
        # We grab the pivot itself
        pivot = self.array[pivot_index]
        # Start the right pointer immediately to the left of the pivot
        right -= 1
        while True:
            # Move the left pointer to the right as long as it points
            # to value that is less than the pivot
            while self.array[left] < pivot:
                left += 1

            # Move the right pointer to the left as long as it points
            # to value that is greater than the pivot:
            while self.array[right] > pivot:
                right -= 1
            # Pointer movement is stopped
            # Check if left has moved beyond right and break
            if left >= right:
                break
            # Else, swap left and right pointer values
            else:
                self.array[left], self.array[right] = self.array[right], self.array[left]
                # Move left one step up for the next round:
                left += 1
        # Final step:
        # Swap the value of the pointer and the pivot:
        self.array[left], self.array[pivot_index] = self.array[pivot_index], self.array[left]
        # Return left pointer. This is needed for Quicksort implementation
        return left

    def quicksort(self, left, right):
        # Base case: sub array has 1 or 0 els:
        if right - left <= 0:
            return
        # Partition the array and grab the new pivot index:
        pivot_index = self.partition(left, right)
        # Recursively call this function on the left and the right:
        self.quicksort(left, pivot_index-1)
        self.quicksort(pivot_index+1, right)


arr = [0,5,2,1,6,3]
s_arr = SortableArray(arr)
s_arr.quicksort(0,len(s_arr.array)-1)
print(s_arr.array)
