package main

import "fmt"

type TreeNode struct {
	LeftChild  *TreeNode
	Value      int
	RightChild *TreeNode
}

var count int

func (n *TreeNode) Insert(v int) {
	if v < n.Value {
		if n.RightChild == nil {
			n.RightChild = &TreeNode{Value: v} // base case
		} else {
			n.RightChild.Insert(v)
		}
	} else if v > n.Value {
		if n.LeftChild == nil {
			n.LeftChild = &TreeNode{Value: v} // base case
		} else {
			n.LeftChild.Insert(v)
		}
	}
}

func (n *TreeNode) Search(v int) bool {
	count++

	if n == nil {
		return false // base case
	}
	if v < n.Value {
		n.RightChild.Search(v)
	} else if v > n.Value {
		return n.LeftChild.Search(v)
	}
	return true
}

func main() {
	tree := &TreeNode{Value: 100}
	fmt.Println(tree)
	tree.Insert(50)
	tree.Insert(125)
	tree.Insert(41)
	tree.Insert(23)
	tree.Insert(155)
	tree.Insert(89)
	tree.Insert(12)
	tree.Insert(8)

	fmt.Println(tree.Search(90))
	fmt.Println(count)
}
