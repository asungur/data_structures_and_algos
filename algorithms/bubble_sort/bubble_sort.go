package main

import "fmt"

func BubbleSort(inputArr []int) []int {
	unsortedUntil := len(inputArr) - 1
	sorted := false

	for sorted != true {
		sorted = true
		for i := 0; i < unsortedUntil; i++ {
			if inputArr[i] > inputArr[i+1] {
				inputArr[i], inputArr[i+1] = inputArr[i+1], inputArr[i]
				sorted = false
			}
		}
		unsortedUntil--
	}
	return inputArr
}

func main() {
	fmt.Println(BubbleSort([]int{65, 55, 45, 35, 25, 15, 10}))
	fmt.Println(BubbleSort([]int{}))
}
