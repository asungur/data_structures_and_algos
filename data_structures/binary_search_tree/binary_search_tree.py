class TreeNode:
    def __init__(self, val, left=None, right=None):
        self.value = val
        self.leftChild = left
        self.rightChild = right

def search(searchValue, node):
    if node is None or node.value == searchValue:
        return node
    elif searchValue < node.Value:
        return search(searchValue, node.leftChild)
    else:
        return search(searchValue, node.rightChild)

def insert(value, node):
    if value < node.value:
        if node.leftChild is None:
            node.leftChild = TreeNode(value)
        else:
            insert(value, node.leftChild)
    elif value > node.value:
        if node.rightChild is None:
            node.rightChild = TreeNode(value)
        else:
            insert(value, node.rightChild)

def delete(valueToDelete, node):
    # Base case: you hit the bottom of the tree
    if node is None:
        return None

    # Recursive calls
    # Also return node to be used as the new value of its paren'ts left/right child:
    elif valueToDelete < node.value:
        node.leftChild = delete(valueToDelete, node.leftChild)
        return node
    elif valueToDelete > node.value:
        node.rightChild = delete(valueToDelete, node.rightChild)
        return node
    elif valueToDelete == node.value:
        # If no left or right child, return the other child. This way you delete the current node
        if node.leftChild is None:
            return node.rightChild
        elif node.rightChild is None:
            return node.leftChild
        else:
            # If it has two children, we use lift function to replace the node
            node.rightChild = lift(node.rightChild, node)
            return node

def lift(node, nodeToDelete):
    # Find a successor node if there is a left child:
    if node.leftChild:
        node.leftChild = lift(node.leftChild, nodeToDelete)
        return node
    else:
        # If no leftChild, you reacheD to the successor node. Take its value and lift
        nodeToDelete.value = node.value
        return node.rightChild

def traverse_and_print(node):
    if node is None:
        return
    traverse_and_print(node.leftChild)
    print(node.value)
    traverse_and_print(node.rightChild)

def find_greatest(node):
    if node.rightChild is None:
        return node.value
    return find_greatest(node.rightChild)

node1 = TreeNode(25)
node2 = TreeNode(75)
root = TreeNode(50, node1, node2)
