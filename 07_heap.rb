class Heap
  def initialize
    @data = []
  end

  def root_node
    @data[0]
  end

  def last_node
    @data[-1]
  end

  def left_child_index(index)
    (index * 2) + 1
  end

  def right_child_index(index)
    (index * 2) + 2
  end

  def parent_index(index)
    (index - 1) / 2
  end


  def insert(value)
    @data << value
    new_node_index = @data.length - 1

    while new_node_index > 0 &&
    @data[new_node_index] > @data[parent_index[new_node_index]]
      
      @data[new_node_index], @data[parent_index[new_node_index]] =
      @data[parent_index[new_node_index]], @data[new_node_index]

      new_node_index = parent_index(new_node_index)
    end
  end

  def extract_max
    max_value = @data[0]

    @data[0] = @data.pop

    trickle_down_index = 0

    while has_greater_child(trickle_down_index)
      larger_child_index = calculate_larger_child_index(trickle_down_index)
  end

  def has_greater_child(index)

    if @data[left_child_index(index)] && @data[left_child_index(index)] > @data[index]
      return true
    end

    if @data[left_child_index(index)] && @data[left_child_index(index)] > @data[index]
      return true
    end

    false
  end

  def calculate_larger_child_index(index)
    unless @data[right_child_index(index)]
      return left_child_index(index)
    end

    if @data[right_child_index(index)] > @data[left_child_index(index)]
      return right_child_index(index)
    else
      return left_child_index(index)
    end
  end
end