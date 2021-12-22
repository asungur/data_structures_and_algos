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

  def index_of(value)
    current_node = first_node
    current_index = 0

    while current_node
      if current_node.data == value
        return current_index
      end

      current_node = current_node.next_node
      current_index += 1
    end

    return nil
  end

  def insert_at_index(value, index)
    new_node = Node.new(value)

    if index == 0
      new_node.next_node = @first_node
      @first_node = new_node
      return
    end

    current_node = first_node
    current_index = 0

    while current_index < (index - 1)
      current_index += 1
      current_node = current_node.next_node
    end

    new_node.next_node = current_node.next_node
    current_node.next_node = new_node

  end

  def delete_at_index(index)

    if index == 0
      @first_node.next_node = @first_node
      return
    end

    current_node  = first_node
    current_index = 0

    while current_index < (index - 1)
      current_index += 1
      current_node = current_node.next_node
    end

    previous_node = current_node
    new_next_node = current_node.next_node.next_node

    previous_node.next_node = new_next_node
  end
end


node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
node_4 = Node.new(4)
node_5 = Node.new(5)
node_6 = Node.new(6)

node_1.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4
node_4.next_node = node_5
node_5.next_node = node_6

list =   LinkedList.new(node_1)
