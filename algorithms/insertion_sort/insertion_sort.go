package main

import "fmt"

func InsertionSort(arr []int) []int {

	for i := 1; i < len(arr); i++ {
		tempValue := arr[i]
		comparisonPos := i - 1

		for comparisonPos >= 0 {
			if arr[comparisonPos] > tempValue {
				arr[comparisonPos+1] = arr[comparisonPos]
				comparisonPos--
			} else {
				break
			}
		}
		arr[comparisonPos+1] = tempValue
	}
	return arr
}

func main() {
	fmt.Println(InsertionSort([]int{4, 2, 7, 1, 3}))
}
