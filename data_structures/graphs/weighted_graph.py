class WeightedGraphVertex:
  def __init__(self, value):
    self.value = value
    self.adjacent_vertices = {}

  def add_adjacent_vertex(self, vertex, weight):
    self.adjacent_vertices[vertex] = weight


# Example of creating flight graph between Dallas-Toronto
dallas = WeightedGraphVertex("Dallas")
toronto = WeightedGraphVertex("Toronto")

# Values are cost of flights in USD
dallas.add_adjacent_vertex(toronto, 138)
toronto.add_adjacent_vertex(dallas, 216)