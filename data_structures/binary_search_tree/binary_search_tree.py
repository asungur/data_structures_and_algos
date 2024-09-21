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
node1 = TreeNode(25)
node2 = TreeNode(75)
root = TreeNode(50, node1, node2)
