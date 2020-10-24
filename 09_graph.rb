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

graph = []

def dfs_traverse(vertex, visited = {})
  visited[vertex.value] = true

  puts vertex.value

  vertex.adjacent_vertices.each do |adjacent_vertex|
    next if visited[adjacent_vertex]

    dfs_traverse(adjacent_vertex, visited)
  end
end

def dfs(vertex, search_value, visited_vertices = {})
  return vertex if vertex.value == search_value

  visited_vertices[vertex.value] = true
  
  vertex.adjacent_vertices.each do |adjacent_vertex|
    next if visited_vertices[adjacent_vertex.value]

    return adjacent_vertex if adjacent_vertex.value == search_value

    vertex_were_searching_for = dfs(adjacent_vertex, search_value,visited_vertices)

    return vertex_were_searching_for if vertex_were_searching_for
  end

  return nil
end

def bfs_traverse(starting_vertex)
  queue = Queue.new

  visited_vertices = {}
  visited_vertices[starting_vertex.value] = true

  queue.enqueue(starting_vertex)

  while queue.read

    current_vertex = queue.dequeue

    puts current_vertex.value

    current_vertex.adjacent_vertices.each do |adjacent_vertex|

      unless visited_vertices[adjacent_vertex.value]

        visited_vertices[adjacent_vertex.value] = true

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