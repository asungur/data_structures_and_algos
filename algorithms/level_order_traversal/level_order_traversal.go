package main

import (
	"errors"
	"fmt"
)

type TreeNode struct {
	LeftChild  *TreeNode
	Value      int
	RightChild *TreeNode
}

func (n *TreeNode) Insert(v int) error {
	if n == nil {
		return errors.New("Node is not valid")
	}
	if n.Value == v {
		return errors.New("Value already exists")
	}

	if v > n.Value {
		if n.RightChild == nil {
			n.RightChild = &TreeNode{Value: v} // base case
			return nil
		}
		return n.RightChild.Insert(v)
	} else if v < n.Value {
		if n.LeftChild == nil {
			n.LeftChild = &TreeNode{Value: v} // base case
			return nil
		}
		return n.LeftChild.Insert(v)
	}
	return nil
}

func (n *TreeNode) BFS() {
	queue := []*TreeNode{n}

	for len(queue) != 0 {
		currentNode := queue[0]
		queue = queue[1:]
		fmt.Println(currentNode.Value)
		left, right := currentNode.LeftChild, currentNode.RightChild
		if left != nil {
			queue = append(queue, left)
		}
		if right != nil {
			queue = append(queue, right)
		}
	}
}

func main() {
	tree := &TreeNode{Value: 100}
	tree.Insert(50)
	tree.Insert(125)
	tree.Insert(21)
	tree.Insert(55)
	tree.Insert(155)
	tree.Insert(110)
	tree.Insert(12)
	tree.Insert(41)

	tree.BFS()
}
