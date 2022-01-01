package main

import "fmt"

type node struct {
	data     int
	next     *node
	previous *node
}

type linkedList struct {
	head   *node
	tail   *node
	length int
}

func (l *linkedList) append(n *node) {
	if l.length == 0 {
		l.head = n
		l.tail = n
	} else {
		secondToLast := l.tail
		l.tail = n
		l.tail.previous = secondToLast
		secondToLast.next = n
	}
	l.length++
}

func (l linkedList) printData() {
	fmt.Println("-----")
	defer fmt.Println("-----")

	displayNode := l.head
	for i := 0; i < l.length; i++ {
		fmt.Printf("%d \n", displayNode.data)
		displayNode = displayNode.next
	}
}

func main() {
	myList := linkedList{}
	node1 := &node{data: 200}
	node2 := &node{data: 300}
	node3 := &node{data: 900}
	node4 := &node{data: 9}
	node5 := &node{data: 13}
	myList.append(node1)
	myList.append(node2)
	myList.append(node3)
	myList.append(node4)
	myList.append(node5)

	myList.printData()
}
