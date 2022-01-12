package main

func twoSum(numbers []int, target int) []int {
	left, right := 0, len(numbers)-1
	total := numbers[left] + numbers[right]

	for total != target {
		if total > target {
			right--
		} else {
			left++
		}
		total = numbers[left] + numbers[right]
	}
	return []int{left + 1, right + 1}
}
