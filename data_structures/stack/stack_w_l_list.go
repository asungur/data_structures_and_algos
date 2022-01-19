package main

import "fmt"

type node struct {
	val  int
	next *node
}

type Stack struct {
	Current *node
	Length  int
}

func (s *Stack) Push(item int) {
	s.Current = &node{item, s.Current}
	s.Length++
}

func (s *Stack) Pop() int {
	lastNode := s.Current
	s.Current = s.Current.next
	s.Length--
	return lastNode.val
}

func (s *Stack) Size() int {
	return s.Length
}

func (s *Stack) Peek() int {
	return s.Current.val
}

func main() {
	stack := Stack{}
	fmt.Println(stack)
	// stack.Push(10)
	// stack.Push(20)
	// stack.Push(30)
	// stack.Pop()
	// fmt.Println(stack)
}
