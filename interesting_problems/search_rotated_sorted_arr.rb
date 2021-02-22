# Given an array(sorted, ascending but rotated) find the given value index(or -1 if doesnt exist)
# ALGO:
# If the array was sorted(not rotated) we would use binary search only
# Now we would still use binary search but we also adjust end and start values according to target value



# There is an integer array nums sorted in ascending order (with distinct values).
# Prior to being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
# Given the array nums after the rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

# LEETCODE SOLUTION
# SPEED: 99%
# MEMO: 45%


def search(nums, target)
  left, right = 0, nums.size - 1
  
  while left <= right
    mid = (left + right) / 2
    
    return mid if (nums[mid] == target)
    
    if nums[mid] >= nums[left]
      if nums[mid] >= target && target >= nums[left]
        right = mid - 1
      else
        left = mid + 1
      end
    else
      if nums[mid] <= target && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end

  return -1
end

# p search([4,5,6,7,0,1,2], 0)
# expected: 4

# p search([4,5,6,7,0,1,2], 3)
# expected: -1

# p search([1], 0)
# expected: -1

# p search([1], 1)
# expected: 0



