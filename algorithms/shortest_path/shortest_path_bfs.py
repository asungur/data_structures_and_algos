# This example represents an unweighted graph.
from queue import Queue


class Vertex:
    def __init__(self, value):
        self.value = value
        self.adjacent_vertices = []
        
    def add_adjacent_vertex(self, vertex):
        self.adjacent_vertices.append(vertex)
        if self not in vertex.adjacent_vertices:
            vertex.add_adjacent_vertex(self)
    def show_adjacent_vertices(self):
        return [vertex.value for vertex in self.adjacent_vertices]

idris = Vertex("Idris")
talia = Vertex("Talia")
kamil = Vertex("Kamil")
ken = Vertex("Ken")
lina = Vertex("Lina")
marco = Vertex("Marco")
sasha = Vertex("Sasha")

idris.add_adjacent_vertex(talia)
talia.add_adjacent_vertex(ken)
ken.add_adjacent_vertex(marco)
marco.add_adjacent_vertex(sasha)
sasha.add_adjacent_vertex(lina)
lina.add_adjacent_vertex(kamil)
kamil.add_adjacent_vertex(idris)

# print(idris.show_adjacent_vertices())  # Output: ['Talia', 'Kamil']
# print(talia.show_adjacent_vertices())  # Output: ['Idris', 'Ken']
# print(ken.show_adjacent_vertices())  # Output: ['Idris', 'Marco']
# print(marco.show_adjacent_vertices())  # Output: ['Ken', 'Sasha']
# print(sasha.show_adjacent_vertices())  # Output: ['Marco', 'Lina']
# print(lina.show_adjacent_vertices())  # Output: ['Sasha', 'Kamil']
# print(kamil.show_adjacent_vertices())  # Output: ['Lina', 'Idris']

# Instead of using dijkstra's algorithm, we can use BFS to find the shortest path
# This works better on unweighted graphs, because if a node is already visited during the iteration
# It means going to this node from another path will be longer and this can be skipped anyway.
def find_shortest_path(first_vertex, second_vertex, visited_vertices={}):
    queue = []
    
    previous_vertex_table = {}
    visited_vertices[first_vertex.value] = True
    queue.append(first_vertex)
    
    while len(queue) > 0:
        current_vertex = queue.pop(0)
        
        for adjacent_vertex in current_vertex.adjacent_vertices:
            if adjacent_vertex.value not in visited_vertices:
                visited_vertices[adjacent_vertex.value] = True
                queue.append(adjacent_vertex)
                
                previous_vertex_table[adjacent_vertex.value] = current_vertex.value
    
    shortest_path = []
    current_vertex_value = second_vertex.value
    while current_vertex_value != first_vertex.value:
        shortest_path.append(current_vertex_value)
        current_vertex_value = previous_vertex_table[current_vertex_value]
    shortest_path.append(first_vertex.value)
    shortest_path.reverse()
    return shortest_path

print(find_shortest_path(idris, lina))