package main

import "fmt"

func Partition(arr []int, leftPointer int, rightPointer int) ([]int, int) {
	pivotIndex := rightPointer
	pivot := arr[pivotIndex]
	rightPointer--

	for {
		for arr[leftPointer] < pivot && leftPointer < len(arr) {
			leftPointer++
		}
		for arr[rightPointer] > pivot && rightPointer > 0 {
			rightPointer--
		}
		if leftPointer >= rightPointer {
			break
		} else {
			arr[leftPointer], arr[rightPointer] = arr[rightPointer], arr[leftPointer]
			leftPointer++
		}
	}
	arr[leftPointer], arr[pivotIndex] = arr[pivotIndex], arr[leftPointer]

	return arr, leftPointer
}

func Quicksort(arr []int, leftIndex int, rightIndex int) []int {
	if rightIndex > leftIndex {
		arr, pivotIndex := Partition(arr, leftIndex, rightIndex)
		arr = Quicksort(arr, leftIndex, pivotIndex-1)
		arr = Quicksort(arr, pivotIndex+1, rightIndex)
	}
	return arr
}

func main() {
	fmt.Println(Quicksort([]int{0, 1, 2, 3, 6, 5}, 0, 5))
	testArr := []int{55, 90, 74, 20, 16, 46, 43, 59, 2, 99, 79, 10, 73, 1, 68, 56, 3, 87, 40, 78, 14, 18, 51, 24, 57, 89, 4, 62, 53, 23, 93, 41, 95, 84, 88}
	fmt.Println(Quicksort(testArr, 0, len(testArr)-1))
}
