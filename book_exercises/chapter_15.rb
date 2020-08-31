# 1. Imagine you were to take an empty binary search tree and insert the following sequence of numbers in this order: [1, 5, 9, 2, 4, 10, 6, 3, 8].

# Draw a diagram showing what the binary search tree would look like. Remember, the numbers are being inserted in the order presented here.


# 2. If a well-balanced binary search tree contains 1,000 values, what is the maximum number of steps it would take to search for a value within it?

# log(N) => 10

# 3. Write an algorithm that finds the greatest value within a binary search tree.

def max(node)
  if node.right_child
    return max(node.right_child)
  else
    return node.value
  end
end


# 4. In the text I demonstrated how to use inorder traversal to print a list of all the book titles. Another way to traverse a tree is known as preorder traversal. Here is the code for it as applied to our book app:

def traverse_and_print(node)
  return if node.nil?
  puts node.value

  traverse_and_print(node.left_child)

  traverse_and_print(node.right_child)
end

# For the example tree in the text (the one with Moby Dick and the other book titles), write out the order in which the book titles are printed with preorder traversal. As a reminder, here is the example tree:

# 5. There is yet another form of traversal called postorder traversal. Here is the code as applied to our book app:

def traverse_and_print(node)
  return if node.nil?
  traverse_and_print(node.left_child)
  traverse_and_print(node.right_child)
  print(node.value)
end

# For the example tree in the text (which also appears in the previous exercise), write out the order in which the book titles are printed with postorder traversal.