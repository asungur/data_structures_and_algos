package main

import (
	"fmt"
	"sort"
)

func threeSum(nums []int) (results [][]int) {
	sort.Slice(nums, func(i, j int) bool {
		return nums[i] < nums[j]
	})

	for leftPointer := 0; leftPointer < len(nums); leftPointer++ {
		if leftPointer != 0 && nums[leftPointer] == nums[leftPointer-1] {
			continue
		}
		midPointer, rightPointer := leftPointer+1, len(nums)-1
		for midPointer < rightPointer {
			left, mid, right := nums[leftPointer], nums[midPointer], nums[rightPointer]
			if left+mid+right == 0 {
				results = append(results, []int{left, mid, right})
				midPointer++
				for midPointer < rightPointer && nums[midPointer] == nums[midPointer-1] {
					midPointer++
				}
			} else if left+mid+right < 0 {
				midPointer++
			} else {
				rightPointer--
			}
		}
	}
	return
}

func main() {
	tempArr := []int{-1, 0, 1, 2, -1, -4}
	// tempArr2 := []int{0, 0, 0, 0}
	fmt.Println(threeSum(tempArr))
}
