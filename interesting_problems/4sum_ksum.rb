# Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
# Notice that the solution set must not contain duplicate quadruplets.

# Solution 1: Building upon two sum
# speed: 90%
# memo: 95%

def four_sum(nums, target)
  return [] if nums.length < 4

  nums = nums.sort
  k_sum(0, 4, target, nums)
end

def k_sum(start, k, target, nums)
  length = nums.length
  res = []

  return res if nums[0] * k > target || length == 0
  return res if nums[-1] * k < target

  if k == 2
    two_sum(nums, target, start)
  else
    (start..(length - k + 1)).each do |index|
      next if index != start && nums[index] == nums[index - 1]

      set = k_sum(index + 1, k - 1, target - nums[index], nums)

      next unless set != []

      set = set.map { |array| array.flatten + [nums[index]] }

      res += set
    end
    res.uniq
  end
end

def two_sum(nums, target, start)
  lo = start
  hi = nums.length - 1
  res = []

  while lo < hi
    lo_num = nums[lo]
    hi_num = nums[hi]
    sum = lo_num + hi_num

    if sum > target
      hi -= 1
    elsif sum < target
      lo += 1
    else
      res.push([lo_num, hi_num])
      hi -= 1
      lo += 1
    end
  end
  res
end


# ex:
# Input: nums = [1,0,-1,0,-2,2], target = 0
# Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

p four_sum([1,0,-1,0,-2,2], 0)

