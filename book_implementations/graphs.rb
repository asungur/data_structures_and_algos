class Vertex
  attr_accessor :value, :adjacent_vertices

  def initialize(value)
    @value = value
    @adjacent_vertices = []
  end
  
  def add_adjacent_vertex(vertex)
    @adjacent_vertices << vertex
  end
end

def dfs_traverse(vertex, visited_vertices = {} )
  # Mark vertex as visited by adding it to the hash table:
  visited_vertices[vertex.value] = true

  # Print the vertex's value, so we can make sure our traversal
  # really works
  puts vertex.value

  # Iterate through the current vertex's adjacent vertices:
  vertex.adjacent_vertices.each do |adjacent_vertex|

    # Ignore an adjacent vertex if we've already visited it:
    next if visited_vertices[adjacent_vertex.value]

    dfs_traverse(adjacent_vertex, visited_vertices)
  end
end

def dfs(vertex, search_value, visited_vertices = {})
  # Return the original vertex if it is the one we're
  # searching for
  return vertex if vertex.value == search_value

  visited_vertices[vertex.value] = true
  
  vertex.adjacent_vertices.each do |adjacent_vertex|
    next if visited_vertices[adjacent_vertex.value]

    # If the adjacent vertex is the vertex we're searching for
    # return that vertex:
    return adjacent_vertex if adjacent_vertex.value == search_value

    # Attempt to find the vertex we're searching for by
    # recursively calling this method on the adjacent vertex:
    vertex_were_searching_for = dfs(adjacent_vertex, search_value,visited_vertices)

    # If we were able to find the correct vertex using the above
    # recursion, return the correct vertex:
    return vertex_were_searching_for if vertex_were_searching_for
  end
  # If we haven't found the vertex we're searching for:
  return nil
end

def bfs_traverse(starting_vertex)
  # Check Queue class from previous chapters
  queue = Queue.new

  visited_vertices = {}
  visited_vertices[starting_vertex.value] = true

  queue.enqueue(starting_vertex)

  # While the queue is not empty:
  while queue.read

    # Remove the first vertex off the queue and make it the current vertex:
    current_vertex = queue.dequeue

    # Print the current vertex's value:
    puts current_vertex.value

    # Iterate over current vertex's adjacent vertices:
    current_vertex.adjacent_vertices.each do |adjacent_vertex|

      # If we have not yet visited the adjacent vertex:
      unless visited_vertices[adjacent_vertex.value]

        # Mark the adjacent vertex as visited:
        visited_vertices[adjacent_vertex.value] = true

        # Add the adjacent vertex to the queue:
        queue.enqueue(adjacent_vertex)
      end
    end
  end
end

def bfs(starting_vertex, search_value, visited_vertices={})
  queue = Queue.new
  visited_vertices[starting_vertex.value] = true
  queue.enqueue(starting_vertex)
  while queue.read
    current_vertex = queue.dequeue
    return current_vertex if current_vertex.value == search_value
    current_vertex.adjacent_vertices.each do |adjacent_vertex|
      if !visited_vertices[adjacent_vertex.value]
        visited_vertices[adjacent_vertex.value] = true
        queue.enqueue(adjacent_vertex)
      end
    end
  end
  return nil
end

# alice = Vertex.new("alice")
# bob = Vertex.new("bob")
# cynthia = Vertex.new("cynthia")

# alice.add_adjacent_vertex(bob)
# alice.add_adjacent_vertex(cynthia)
# bob.add_adjacent_vertex(cynthia)
# cynthia.add_adjacent_vertex(bob)

class WeightedGraphVertex
  attr_accessor :value, :adjacent_vertices

  def initialize(value)
    @value = value
    @adjacent_vertices = {}
  end

  def add_adjacent_vertex(vertex, weight)
    @adjacent_vertices[vertex] = weight
  end
end

# dallas = City.new("Dallas")
# toronto = City.new("Toronto")

# dallas.add_adjacent_vertex(toronto, 138)
# toronto.add_adjacent_vertex(dallas, 216)