class Vertex:
    def __init__(self, value):
        self.value = value
        self.adjacent_vertices = []

    def add_adjacent_vertex(self, vertex):
        self.adjacent_vertices.append(vertex)
        
    # For undirected graphs, the connection is bidirectional
    # def add_adjacent_vertex(self, vertex):
    #     if vertex in self.adjacent_vertices:
    #         return
    #     self.adjacent_vertices.append(vertex)
    #     vertex.add_adjacent_vertex(self)

def dfs(vertex, search_value, visited_vertices={}):
  # Return the original vertex if it is the one we're searching for:
  if vertex.value == search_value:
    return vertex

  visited_vertices[vertex.value] = True
  
  for adjacent_vertex in vertex.adjacent_vertices:
    if adjacent_vertex.value in visited_vertices:
      continue

    # If the adjacent vertex is the vertex we're searching for
    # return that vertex:
    if adjacent_vertex.value == search_value:
      return adjacent_vertex

    # Attempt to find the vertex we're searching for by
    # recursively calling this method on the adjacent vertex:
    vertex_were_searching_for = dfs(adjacent_vertex, search_value,visited_vertices)

    # If we were able to find the correct vertex using the above
    # recursion, return the correct vertex:
    if vertex_were_searching_for:
      return vertex_were_searching_for
    
def bfs(starting_vertex, search_value, visited_vertices={}):
  queue = Queue()
  
  visited_vertices[starting_vertex.value] = True
  queue.enqueue(starting_vertex)

  # While the queue is not empty:
  while queue.read():
    # OR remove the first vertex off the queue and make it the current vertex:
    current_vertex = queue.dequeue()

    # Return if the value is the one
    if current_vertex.value == search_value:
      return current_vertex

    # Print the current vertex's value:
    print(current_vertex.value)

    # Iterate over current vertex's adjacent vertices:
    for adjacent_vertex in current_vertex.adjacent_vertices:

      # If we have not yet visited the adjacent vertex:
      if adjacent_vertex.value not in visited_vertices:

        # Mark the adjacent vertex as visited:
        visited_vertices[adjacent_vertex.value] = True

        # Add the adjacent vertex to the queue:
        queue.enqueue(adjacent_vertex)