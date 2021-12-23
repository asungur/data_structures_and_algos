package main

import "fmt"

type Queue struct {
	values []int
}

func (q *Queue) Enqueue(item int) {
	q.values = append(q.values, item)
}

func (q *Queue) Dequeue() int {
	toReturn := q.values[0]
	q.values = q.values[1:]
	return toReturn
}

func main() {
	queue := Queue{}
	fmt.Println(queue)
	queue.Enqueue(6)
	queue.Enqueue(10)
	queue.Enqueue(12)
	fmt.Println(queue)
	queue.Dequeue()
	fmt.Println(queue)
}
