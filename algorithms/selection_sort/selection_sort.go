package main

import "fmt"

func SelectionSort(arr []int) []int {
	for i := 0; i < len(arr)-1; i++ {
		lowestNumIndex := i

		for t := i + 1; t < len(arr); t++ {
			if arr[t] < arr[lowestNumIndex] {
				lowestNumIndex = t
			}
		}
		if lowestNumIndex != i {
			tempVal := arr[i]
			arr[i] = arr[lowestNumIndex]
			arr[lowestNumIndex] = tempVal
		}
	}
	return arr
}

func main() {
	fmt.Println(SelectionSort([]int{5, 4, 3, 2, 1}))
}
