package main

import "fmt"

type Stack struct {
	values []int
}

func (s *Stack) Push(item int) {
	s.values = append(s.values, item)
}

func (s *Stack) Pop() int {
	lastIndex := len(s.values) - 1
	toRemove := s.values[lastIndex]
	s.values = s.values[:lastIndex]
	return toRemove
}

func main() {
	stack := Stack{}
	fmt.Println(stack)
	stack.Push(10)
	stack.Push(20)
	stack.Push(30)
	stack.Pop()

	fmt.Println(stack)
}
