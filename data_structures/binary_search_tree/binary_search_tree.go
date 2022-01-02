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

// DELETION HELPER FUNCTIONS
func (n *TreeNode) findMax(parent *TreeNode) (*TreeNode, *TreeNode) {
	if n == nil {
		return nil, parent
	}
	if n.RightChild == nil {
		return n, parent
	}
	return n.RightChild.findMax(n)
}

func (n *TreeNode) replaceNode(parent, replacement *TreeNode) error {
	if n == nil {
		return errors.New("Replacement can not take place on a nil node")
	}

	if n == parent.LeftChild {
		parent.LeftChild = replacement
		return nil
	}
	parent.RightChild = replacement
	return nil
}

// OPERATIONS
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

func (n *TreeNode) Search(v int) *TreeNode {
	if n == nil {
		return nil // base case
	}
	switch {
	case v == n.Value:
		return n
	case v < n.Value:
		return n.LeftChild.Search(v)
	default:
		return n.RightChild.Search(v)
	}
}

func (n *TreeNode) Delete(v int, parent *TreeNode) error {
	if n == nil {
		return errors.New("Value does not exist in the Tree")
	}

	switch {
	case v < n.Value:
		return n.LeftChild.Delete(v, n)
	case v > n.Value:
		return n.RightChild.Delete(v, n)
	default:
		if n.LeftChild == nil && n.RightChild == nil {
			n.replaceNode(parent, nil)
			return nil
		}
		if n.LeftChild == nil {
			n.replaceNode(parent, n.RightChild)
			return nil
		}
		if n.RightChild == nil {
			n.replaceNode(parent, n.LeftChild)
			return nil
		}
		replacement, replParent := n.LeftChild.findMax(n)
		n.Value = replacement.Value
		return replacement.Delete(replParent.Value, replParent)
	}
}

func (n *TreeNode) Traverse() {
	if n == nil {
		return
	}
	n.LeftChild.Traverse()
	fmt.Println(n.Value)
	n.RightChild.Traverse()
}

func main() {
	tree := &TreeNode{Value: 100}
	// fmt.Println(tree)
	tree.Insert(50)
	tree.Insert(125)
	tree.Insert(21)
	tree.Insert(55)
	tree.Insert(155)
	tree.Insert(110)
	tree.Insert(12)
	tree.Insert(41)

	toDeleteParent := tree.Search(21)
	fmt.Println(toDeleteParent)
	fmt.Println(tree.Delete(12, toDeleteParent))

	tree.Traverse()
	// fmt.Println(count)
}
