class City
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    @routes = {}
  end

  def add_route(city, price)
    @routes[city] = price
  end
end

atlanta = City.new("Atlanta")
boston = City.new("Boston")
chicago = City.new("Chicago")
denver = City.new("Denver")
el_paso = City.new("El Paso")
atlanta.add_route(boston, 100)
atlanta.add_route(denver, 160)
boston.add_route(chicago, 120)
boston.add_route(denver, 180)
chicago.add_route(el_paso, 80)
denver.add_route(chicago, 40)
denver.add_route(el_paso, 140)

def dijkstra_shortest_path(starting_city, final_destination)
  cheapest_prices_table = {}
  cheapest_previous_stopover_city_table = {}

  # To keep our code simple, we'll use a basic array to keep track of
  # the known cities we haven't yet visited:
  unvisited_cities = []

  # We keep track of the cities we've visited using a hash table.
  # We could have used an array, but since we'll be doing lookups,
  # a hash table is more efficient:
  visited_cities = {}

  # We add the starting city's name as the first key inside the
  # cheapest_prices_table. It has a value of 0, since it costs nothing
  # to get there:
  cheapest_prices_table[starting_city.name] = 0

  current_city = starting_city

  # This loop is the core of the algorithm. It runs as long as we can
  # visit a city that we haven't visited yet:
  while current_city

    # We add the current_city's name to the visited_cities hash to record
    # that we've officially visited it. We also remove it from the list
    # of unvisited cities:
    visited_cities[current_city.name] = true
    unvisited_cities.delete(current_city)

    # We iterate over each of the current_city's adjacent cities:
    current_city.routes.each do |adjacent_city, price|

      # If we've discovered a new city,
      # we add it to the list of unvisited_cities:
      unvisited_cities <<
      adjacent_city unless visited_cities[adjacent_city.name]

      # We calculate the price of getting from the STARTING city to the
      # ADJACENT city using the CURRENT city as the second-to-last stop:
      price_through_current_city =
      cheapest_prices_table[current_city.name] + price

      # If the price from the STARTING city to the ADJACENT city is
      # the cheapest one we've found so far...
      if !cheapest_prices_table[adjacent_city.name] ||
      price_through_current_city <
      cheapest_prices_table[adjacent_city.name]

        # ... we update our two tables:
        cheapest_prices_table[adjacent_city.name] =
        price_through_current_city

        cheapest_previous_stopover_city_table[adjacent_city.name] =
        current_city.name
      end
    end

    # We visit our next unvisited city. We choose the one that is cheapest
    # to get to from the STARTING city:
    current_city = unvisited_cities.min do |city|
      cheapest_prices_table[city.name]
    end
  end
  # We have completed the core algorithm. At this point, the
  # cheapest_prices_table contains all the cheapest prices to get to each
  # city from the starting city. However, to calculate the precise path
  # to take from our starting city to our final destination,
  # we need to move on.
  # We'll build the shortest path using a simple array:
  shortest_path = []
  # To construct the shortest path, we need to work backwards from our
  # final destination. So, we begin with the final destination as our
  # current_city_name:
  current_city_name = final_destination.name
  # We loop until we reach our starting city:
  while current_city_name != starting_city.name
    # We add each current_city_name we encounter to the shortest path array:
    shortest_path << current_city_name
    # We use the cheapest_previous_stopover_city_table to follow each city
    # to its previous stopover city:
    current_city_name =
    cheapest_previous_stopover_city_table[current_city_name]
  end
  # We cap things off by adding the starting city to the shortest path:
  shortest_path << starting_city.name
  # We reverse the output so we can see the path from beginning to end:
  return shortest_path.reverse
end

# Find Shortest Path in unweighted graph

def find_shortest_path(first_vertex, second_vertex, visited_vertices={})
  queue = Queue.new
  # As in Dijkstra's algorithm, we keep track in a table of each vertex
  # immediately preceding vertex.
  previous_vertex_table = {}
  # We employ breadth-first search:
  visited_vertices[first_vertex.value] = true
  queue.enqueue(first_vertex)
  while queue.read
    current_vertex = queue.dequeue
    current_vertex.adjacent_vertices.each do |adjacent_vertex|
      if !visited_vertices[adjacent_vertex.value]
        visited_vertices[adjacent_vertex.value] = true
        queue.enqueue(adjacent_vertex)
        # We store in the previous_vertex table the adjacent_vertex
        # as the key, and the current_vertex as the value. This
        # indicates that the current_vertex is the immediately
        # preceding vertex that leads to the adjacent_vertex.
        previous_vertex_table[adjacent_vertex.value] =
        current_vertex.value
      end
    end
  end
  # As in Dijkstra's algorithm, we work backwards through the
  # previous_vertex_table to build the shortest path;
  shortest_path = []
  current_vertex_value = second_vertex.value
  while current_vertex_value != first_vertex.value
    shortest_path << current_vertex_value
    current_vertex_value = previous_vertex_table[current_vertex_value]
  end
  shortest_path << first_vertex.value
  return shortest_path.reverse
end