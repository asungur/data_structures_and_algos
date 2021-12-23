package main

import "fmt"

const ArraySize = 7

// HashTable struct
type HashTable struct {
	array [ArraySize]*bucket
}

// bucket struct
type bucket struct {
	head *bucketNode
}

// bucketNode
type bucketNode struct {
	value string
	next  *bucketNode
}

// Insert
func (h *HashTable) Insert(value string) {
	index := hash(value)
	h.array[index].insert(value)
}

// Search
func (h *HashTable) Search(value string) bool {
	index := hash(value)
	return h.array[index].search(value)
}

// Delete
func (h *HashTable) Delete(value string) {
	index := hash(value)
	h.array[index].delete(value)
}

// insert
func (b *bucket) insert(v string) {
	if !b.search(v) {
		newNode := &bucketNode{value: v}
		newNode.next = b.head
		b.head = newNode
	} else {
		fmt.Println(v, "already exists")
	}
}

// search
func (b *bucket) search(v string) bool {
	currentNode := b.head

	for currentNode != nil {
		if currentNode.value == v {
			return true
		}
		currentNode = currentNode.next
	}
	return false
}

// delete
func (b *bucket) delete(v string) {

	if b.head.value == v {
		b.head = b.head.next
		return
	}
	previousNode := b.head
	for previousNode.next != nil {
		if previousNode.next.value == v {
			previousNode.next = previousNode.next.next
			return
		}
		previousNode = previousNode.next
	}
}

// hash
func hash(value string) int {
	sum := 0
	for _, v := range value {
		sum += int(v)
	}
	return sum % ArraySize
}

// Init
func Init() *HashTable {
	result := &HashTable{}
	for i := range result.array {
		result.array[i] = &bucket{}
	}
	return result
}

func main() {
	testHash := Init()
	list := []string{
		"ESTUS",
		"FLASH",
		"BOAR",
		"GOLEM",
		"TITANITE",
		"RING",
	}

	for _, v := range list {
		testHash.Insert(v)
	}

	testHash.Delete("GOLEM")
}
