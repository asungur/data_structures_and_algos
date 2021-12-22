# Remove all elements from a linked list of integers that have value val.
# Example:

# Input:  1->2->6->3->4->5->6, val = 6
# Output: 1->2->3->4->5

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}


# SPEED 10%
# MEMO  50%
def remove_elements(head, val)
  return nil unless !!head

  current_node = head
  while !!current_node.next
    if current_node.next.val == val
      current_node.next = current_node.next.next
    else
      current_node = current_node.next
    end
  end
  if head.val == val
    head = head.next
  end
  head
end


a = ListNode.new(6)
b = ListNode.new(5, a)
c = ListNode.new(4, b)
d = ListNode.new(3, c)
e = ListNode.new(6, d)
f = ListNode.new(2, e)
h = ListNode.new(1, f)

# remove_elements(h, 6)
# check = h
# while !!check.next
#   p check.val
#   check = check.next
# end
