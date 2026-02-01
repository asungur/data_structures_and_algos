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