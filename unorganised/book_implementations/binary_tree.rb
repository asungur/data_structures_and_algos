class TreeNode
  def initialize(value, left=nil, right=nil)
    @value = value
    @left_child = left
    @right_child = right
  end
end

def search(search_value, node)
  # Base case: If the node is nonexistent
  # or we've found the value we're looking for:
  if node.nil? || node.value == search_value
    return node
  # If the value is less than the current node, perform
  # search on the left child:
  elsif search_value < node.value
    return search(search_value, node.left_child)
  else
    return search(search_value, node.right_child)
  end
end

def insert(value, node)
  if value < node.value
    # If the left child does not exist, we want to insert
    # the value as the left child:
    if node.left_child.nil?
      node.left_child = TreeNode.new(value)
    else
      insert(value, node.left_child)
    end
  elsif value > node.value
    # If the right child does not exist, we want to insert
    # the value as the right child:
    if node.right_child.nil?
      node.right_child = TreeNode.new(value)
    else
      insert(value, node.right_child)
    end
  else
    insert(value, node.right_child)
  end
end

def delete(value_to_delete, node)

  # The base case is when we've hit the bottom of the tree,
  # and the parent node has no children
  if node.nil?
    return nil
  # If the value we're deleting is less or
  # greater than the current node we set the left or right
  # child respectively to be the return value of a recursive call
  # of this very method on the current node's 
  # left or right subtree
  elsif value_to_delete < node.value
    node.left_child = delete(value_to_delete, node.left_child)
    # We return the current node (and its subtree if existent) to 
    # be used as the new value of its parent's left or right child:
    return node
  elsif value_to_delete > node.value
    node.right_child = delete(value_to_delete, node.right_child)
    return node
  # If the current node is the one we want to delete:
  elsif value_to_delete == node.value
    
    # If the current node has no left child, we delete it by 
    # returning its right child (and it's subtree if existent)
    # to be its parent's new subtree:
    if node.left_child.nil?
      return node.right_child
    # If the current node has no left OR right child, this ends up
    # being nil as per the first line of code in this function
    elsif node.right_child.nil?
      return node.left_child
    
    # If the current node has two children, we delete the current
    # node by calling the lift function (below), which changes
    # the current node's value to the value of its successor node:
    else
      node.right_child = lift(node.right_child, node)
      return node
    end
  end
end

def lift(node, node_to_delete)
  # If the current node of this method has a left child,
  # we recursively call this function to continue down
  # the left subtree to find the successor node.
  if node.left_child
    node.left_child = lift(node.left_child, node_to_delete)
    return node
  # If the current node has no left child, that means the current
  # node of this function is the successor node, and we take its
  # value and make it the new value of the node that we're 
  # deleting:
  else
    node_to_delete.value = node.value
    # We return the successor node's right child to be now
    # userd as its parent's left child:
    return node.right_child
  end
end

node1 = TreeNode.new(25)
node2 = TreeNode.new(75)
root = TreeNode.new(50, node1, node2)

def traverse_and_print(node)
  return if node.nil?
  
  traverse_and_print(node.left_child)
  puts node.value
  traverse_and_print(node.right_child)
end
