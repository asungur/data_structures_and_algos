package main

import (
	"fmt"
)

// Brute Force O(N^2)
// func twoSum(nums []int, target int) []int {
// 	for i, char := range nums {
// 		searchVal := target - char
// 		for j := i + 1; j < len(nums); j++ {
// 			if nums[j] == searchVal {
// 				return []int{i, j}
// 			}
// 		}
// 	}
// 	return []int{}
// }

// LOOKUP HASH(MAP) with single loop O(N)
// TOP %3
func twoSum(nums []int, target int) []int {
	lookup := map[int]int{}

	for i, char := range nums {
		searchVal := target - char
		if j, ok := lookup[searchVal]; ok && i != j {
			return []int{j, i}
		}
		lookup[char] = i
	}
	return []int{}
}

func main() {
	fmt.Println(twoSum([]int{3, 2, 4}, 6))
}
