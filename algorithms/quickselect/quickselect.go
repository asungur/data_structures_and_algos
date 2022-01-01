package main

import "fmt"

func Partition(arr []int, leftPointer int, rightPointer int) int {
	pivotIndex := rightPointer
	pivot := arr[rightPointer]
	rightPointer--

	for leftPointer <= rightPointer {
		for leftPointer <= rightPointer && arr[leftPointer] <= pivot {
			leftPointer++
		}
		for leftPointer <= rightPointer && arr[rightPointer] > pivot {
			rightPointer--
		}
		if leftPointer <= rightPointer {
			arr[leftPointer], arr[rightPointer] = arr[rightPointer], arr[leftPointer]
		}
	}
	arr[leftPointer], arr[pivotIndex] = arr[pivotIndex], arr[leftPointer]
	return leftPointer
}

func Quickselect(arr []int, kthLowest, leftIndex, rightIndex int) int {
	for {
		pivotIndex := Partition(arr, leftIndex, rightIndex)
		if pivotIndex == kthLowest-1 {
			return arr[pivotIndex]
		} else if pivotIndex < kthLowest-1 {
			leftIndex = pivotIndex + 1
		} else {
			rightIndex = pivotIndex - 1
		}
	}
}

func main() {
	testArr := []int{0, 1, 2, 3, 6, 5}
	fmt.Println(Quickselect(testArr, 5, 0, len(testArr)-1))
}
