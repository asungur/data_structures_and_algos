# 1. Add a method to the classic LinkedList class that prints all the elements of the list.

class Node
	attr_accessor :data, :next_node

	def initialize(data)
		@data = data
	end
end

class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  def read(index)
    # We begin at the first node of the list:
    current_node = first_node
    current_index = 0
    while current_index < index
      # We keep following the links of each node until we get to the
      # index we're looking for:
      current_node = current_node.next_node
      current_index += 1
      # If we're past the end of the list, that means the
      # value cannot be found in the list, so return nil:
      return nil unless current_node
    end
    return current_node.data
  end

  def index_of(value)
    # We begin at the first node of the list:
    current_node = first_node
    current_index = 0

    while current_node
      # If we find the data we're looking for, we return it:
      if current_node.data == value
        return current_index
      end
      # Otherwise, we move on the next node:
      current_node = current_node.next_node
      current_index += 1
    end
    
    # If we get through the entire list without finding the
    # data, we return nil:
    return nil
  end

  def insert_at_index(index, value)
    # We create the new node with the provided value:
    new_node = Node.new(value)
    
    # If we are inserting at the beginning of the list:
    if index == 0

      # Have our new node link to what was the first node:
      new_node.next_node = first_node
      
      # Establish that our new node is now the list's first node:
      self.first_node = new_node
      return
    end

    # If we are inserting anywhere other than the beginning:
    current_node = first_node
    current_index = 0

    # First, we access the node immediately before where the
    # new node will go:
    while current_index < (index - 1)
      current_node = current_node.next_node
      current_index += 1
    end
    # Have the new node link to the next node:
    new_node.next_node = current_node.next_node
    # Modify the link of the previous node to point to
    # our new node:
    current_node.next_node = new_node
  end

  def delete_at_index(index)
    # If we are deleting the first node:
    if index == 0
      # Simply set the first node to be what is currently the second node:
      self.first_node = first_node.next_node
      return
    end

    current_node = first_node
    current_index = 0
    # First, we find the node immediately before the one we
    # want to delete and call it current_node:
    while current_index < (index - 1)
      current_node = current_node.next_node
      current_index += 1
    end

    # We find the node that comes after the one we're deleting:
    node_after_deleted_node = current_node.next_node.next_node
    
    # We change the link of the current_node to point to the
    # node_after_deleted_node, leaving the node we want
    # to delete out of the list:
    current_node.next_node = node_after_deleted_node
  end

  def print
    current_node = first_node
    current_index = 0

    while current_node
      puts current_node.data
      current_node = current_node.next_node
    end
  end

  def last
    current_node = first_node
    current_index = 0

    while current_node.next_node
      current_node = current_node.next_node
    end
  
    return current_node.data
  end

  def reverse!
    previous_node = nil
    current_node = first_node

    while current_node
      next_node = current_node.next_node 

      current_node.next_node = previous_node

      previous_node = current_node
      
      current_node = next_node
    end
    self.first_node = previous_node
  end
end

# 2. Add a method to the DoublyLinkedList class that prints all the elements of the list in reverse order.

class Node
  attr_accessor :data, :next_node, :previous_node
  
  def initialize(data)
    @data = data
  end  
end

class DoublyLinkedList
  attr_accessor :first_node, :last_node

  def initialize(first_node=nil, last_node=nil)
    @first_node = first_node
    @last_node = last_node
  end

  def insert_at_end(value)
    new_node = Node.new(value)

    # If there are no elements yet in the linked list:
    if !first_node
      @first_node = new_node
      @last_node = new_node
    else # If the linked list already has at least one node:
      new_node.previous_node = @last_node
      @last_node.next_node = new_node
      @last_node = new_node
    end
  end

  def print_reverse
    current_node = last_node

    while current_node
      puts current_node.data
      current_node = current_node.previous_node
    end
  end
end

# 3. Add a method to the classic LinkedList class that returns the last element from the list. Assume you don’t know how many elements are in the list.

# ADDED ABOVE

# 4. Here’s a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list’s links should change so that C -> B -> A.

# ANSWERED ABOVE

# 5. Here’s a brilliant little linked list puzzle for you. Let’s say you have access to a node from somewhere in the middle of a classic linked list, but not the linked list itself. That is, you have a variable that points to an instance of Node, but you don’t have access to the LinkedList instance. In this situation, if you follow this node’s link, you can find all the items from this middle node until the end, but you have no way to find the nodes that precede this node in the list.

def delete_middle_node(node)
  node.data = node.next_node.data
  node.next_node = node.next_node.next_node
end

# Write code that will effectively delete this node from the list. The entire remaining list should remain complete, with only this node removed.