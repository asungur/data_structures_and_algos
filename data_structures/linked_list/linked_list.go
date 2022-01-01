package main

import (
	"errors"
	"fmt"
)

type node struct {
	data int
	next *node
}

type linkedList struct {
	head   *node
	length int
}

func (l *linkedList) prepend(n *node) {
	secondNode := l.head
	l.head = n
	l.head.next = secondNode
	l.length++
}

func (l *linkedList) insertAtIndex(index, value int) {
	currentNode := l.head
	newNode := &node{data: value}

	for i := 0; i < l.length; i++ {
		if index == i+1 {
			newNextNext := currentNode.next
			currentNode.next = newNode
			newNode.next = newNextNext
			l.length++
			break
		} else {
			currentNode = currentNode.next
		}
	}
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

func (l *linkedList) deleteByValue(value int) {
	if l.length == 0 {
		return
	}
	if l.head.data == value {
		l.head = l.head.next
		l.length--
		return
	}
	beforeToDelete := l.head
	for beforeToDelete.next.data != value {
		if beforeToDelete.next.next != nil {
			return
		}
		beforeToDelete = beforeToDelete.next
	}
	beforeToDelete.next = beforeToDelete.next.next
	l.length--
}

func (l *linkedList) readAtIndex(index int) (int, error) {
	currentNode := l.head

	for i := 0; i < l.length; i++ {
		if index == i {
			return currentNode.data, nil
		} else {
			currentNode = currentNode.next
		}
	}
	return -1, errors.New("Index out of range")
}

func (l *linkedList) indexOfValue(value int) (int, error) {
	currentNode := l.head

	for i := 0; i < l.length; i++ {
		if value == currentNode.data {
			return i, nil
		} else {
			currentNode = currentNode.next
		}
	}
	return -1, errors.New("Value is not in the linked list")
}

func main() {
	myList := linkedList{}
	node1 := &node{data: 200}
	node2 := &node{data: 300}
	node3 := &node{data: 900}
	node4 := &node{data: 9}
	node5 := &node{data: 13}
	myList.prepend(node1)
	myList.prepend(node2)
	myList.prepend(node3)
	myList.prepend(node4)
	myList.prepend(node5)

	// myList.insertAtIndex(2, 300)
	// myList.printData()

	// myList.deleteByValue(900)
	// myList.deleteByValue(999) // shouldn't break
	// myList.deleteByValue(13) // head deletion should work
	// myList.printData()

	// emptyList := linkedList{}
	// emptyList.deleteByValue(900)
	// emptyList.printData()
}
