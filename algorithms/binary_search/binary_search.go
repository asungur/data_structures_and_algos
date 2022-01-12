package main

import (
	"errors"
	"fmt"
)

func BinarySearch(sortedNums []int, value int) (midpoint int, err error) {
	lowerBound := 0
	upperBound := len(sortedNums) - 1

	for lowerBound <= upperBound {
		midpoint = (lowerBound + (upperBound - lowerBound)) / 2

		valueAtMid := sortedNums[midpoint]
		if value == valueAtMid {
			return
		} else if value < valueAtMid {
			upperBound = midpoint - 1
		} else if value > valueAtMid {
			lowerBound = midpoint + 1
		}
	}
	midpoint = -1
	err = errors.New("Given value does not exist in the array")
	return
}

func main() {
	fmt.Println(BinarySearch([]int{1, 2, 3, 4, 5, 6}, 7)) // error
	fmt.Println(BinarySearch([]int{1, 2, 3, 4, 5, 6}, 4)) // 3
}
