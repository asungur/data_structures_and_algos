package main

import "fmt"

// TOP SPEED and TOP Memo
func spiralOrder(matrix [][]int) (result []int) {
	rS := 0
	cS := 0
	rE := len(matrix) - 1
	cE := len(matrix[0]) - 1

	for rS <= rE && cS <= cE {
		for i := cS; i <= cE; i++ {
			result = append(result, matrix[rS][i])
		}
		rS++
		for i := rS; i <= rE; i++ {
			result = append(result, matrix[i][cE])
		}
		cE--
		if rS > rE || cS > cE {
			break
		}
		for i := cE; i >= cS; i-- {
			result = append(result, matrix[rE][i])
		}
		rE--
		for i := rE; i >= rS; i-- {
			result = append(result, matrix[i][cS])
		}
		cS++
	}
	return
}

// SIMILAR USING DIRECTIONS
// func spiralOrder(matrix [][]int) (result []int) {
// 	directions := [][]int{{0, 1}, {1, 0}, {0, -1}, {-1, 0}}
// 	rE := len(matrix)
// 	cE := len(matrix[0])
// 	directionSteps := []int{cE, rE - 1}
// 	direction := 0
// 	rS := 0
// 	cS := -1
// 	for directionSteps[direction%2] > 0 {
// 		for i := 0; i < directionSteps[direction%2]; i++ {
// 			rS += directions[direction][0]
// 			cS += directions[direction][1]
// 			result = append(result, matrix[rS][cS])
// 		}
// 		directionSteps[direction%2]--
// 		direction = (direction + 1) % 4
// 	}
// 	return
// }

func main() {
	temp := [][]int{{0, 1, 2, 3}, {4, 5, 6, 7}, {8, 9, 10, 11}}
	fmt.Println(spiralOrder(temp))
}
