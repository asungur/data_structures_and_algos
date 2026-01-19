package main

import "fmt"

type node struct {
	value int
	next  *node
}

type Queue struct {
	Head *node
	Tail *node
	Size int
}

func (q *Queue) Enqueue(item int) {
	newNode := &node{value: item}
	if q.Head == nil {
		q.Head = newNode
		q.Tail = newNode
	} else {
		q.Tail.next = newNode
		q.Tail = q.Tail.next
	}
	q.Size++
}

func (q *Queue) Dequeue() int {
	toBeRemoved := q.Head
	q.Head = q.Head.next
	q.Size--
	return toBeRemoved.value
}

func main() {
	queue := Queue{}
	queue.Enqueue(6)
	fmt.Println(queue.Size)
	// queue.Enqueue(10)
	// fmt.Println(queue.Size)
	// queue.Enqueue(12)
	// fmt.Println(queue.Size)
	// fmt.Println(queue.Dequeue())
	// fmt.Println(queue.Size)
}
