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
end

node_1 = Node.new("once")
node_2 = Node.new("upon")
node_3 = Node.new("a")
node_4 = Node.new("time")
node_1.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4

# Create the linked list
list = LinkedList.new(node_1)

# Read the 4th node
list.read(3)

# Find a value
list.index_of("time")

# Insertion example
list.insert_at_index(3, "purple")