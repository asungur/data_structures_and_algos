class TreeNode
  attr_accessor :value, :left_child, :right_child

  def initialize(value, left=nil, right=nil)
    @value = value
    @left_child = left
    @right_child = right
  end
end

def insert(value, node)
  if value <= node.value
    if node.left_child.nil?
      node.left_child = TreeNode.new(value)
    else
      insert(value, node.left_child)
    end
  elsif value > node.value
    if node.right_child.nil?
      node.right_child = TreeNode.new(value)
    else
      insert(value, node.right_child)
    end
  else
    insert(value, node.right_child)
  end
end

def in_order_traversal(tree_node)
  if !!tree_node && !tree_node.value.nil?
    in_order_traversal(tree_node.left_child)
    puts tree_node.value
    in_order_traversal(tree_node.right_child)
  end
end

def pre_order_traversal(tree_node)
  if !!tree_node && !tree_node.value.nil?
    puts tree_node.value
    pre_order_traversal(tree_node.left_child)
    pre_order_traversal(tree_node.right_child)
  end
end

def post_order_traversal(tree_node)
  if !!tree_node && !tree_node.value.nil?
    post_order_traversal(tree_node.left_child)
    post_order_traversal(tree_node.right_child)
    puts tree_node.value
  end
end

# MANUALLY CONSTRUCT A PERFECT BINARY SEARCH TREE
l4_1 = TreeNode.new(4)
l4_2 = TreeNode.new(11)
l4_3 = TreeNode.new(30)
l4_4 = TreeNode.new(40)
l4_5 = TreeNode.new(52)
l4_6 = TreeNode.new(61)
l4_7 = TreeNode.new(82)
l4_8 = TreeNode.new(95)

l3_1 = TreeNode.new(10, l4_1, l4_2)
l3_2 = TreeNode.new(33, l4_3, l4_4)
l3_3 = TreeNode.new(56, l4_5, l4_6)
l3_4 = TreeNode.new(89, l4_7, l4_8)

l2_1 = TreeNode.new(25, l3_1, l3_2)
l2_2 = TreeNode.new(75, l3_3, l3_4)
root = TreeNode.new(50, l2_1, l2_2)

# in_order_traversal(root)
# pre_order_traversal(root)
# post_order_traversal(root)
