# This example represents an unweighted graph.
class User:
    def __init__(self, name):
        self.name = name
        self.friends = []
        
    def add_friend(self, friend):
        self.friends.append(friend)
        if self not in friend.friends:
            friend.add_friend(self)
    def show_friends(self):
        return [friend.name for friend in self.friends]

idris = User("Idris")
talia = User("Talia")
kamil = User("Kamil")
ken = User("Ken")
lina = User("Lina")
marco = User("Marco")
sasha = User("Sasha")

idris.add_friend(talia)
talia.add_friend(ken)
ken.add_friend(marco)
marco.add_friend(sasha)
sasha.add_friend(lina)
lina.add_friend(kamil)
kamil.add_friend(idris)

# print(idris.show_friends())  # Output: ['Talia', 'Kamil']
# print(talia.show_friends())  # Output: ['Idris', 'Ken']
# print(ken.show_friends())  # Output: ['Idris', 'Marco']
# print(marco.show_friends())  # Output: ['Ken', 'Sasha']
# print(sasha.show_friends())  # Output: ['Marco', 'Lina']
# print(lina.show_friends())  # Output: ['Sasha', 'Kamil']
# print(kamil.show_friends())  # Output: ['Lina', 'Idris']

def dijkstra_shortest_path(starting_user, target_user):
    shortest_connections_table = {}
    shortest_previous_user_table = {}
    unvisited_users = set()
    visited_users = set()
    
    shortest_connections_table[starting_user.name] = 0
    current_user = starting_user
    while current_user:
        visited_users.add(current_user.name)
        if current_user in unvisited_users:
            unvisited_users.remove(current_user)
        
        for friend in current_user.friends:
            if friend.name not in visited_users:
                unvisited_users.add(friend)
            connections_through_current_user = shortest_connections_table[current_user.name] + 1
            if friend.name not in shortest_connections_table or connections_through_current_user < shortest_connections_table[friend.name]:
                shortest_connections_table[friend.name] = connections_through_current_user
                shortest_previous_user_table[friend.name] = current_user.name
        
        current_user = min(unvisited_users, key=lambda user: shortest_connections_table[user.name]) if unvisited_users else None
        
    shortest_path = []
    current_user_name = target_user.name
    while current_user_name != starting_user.name:
        shortest_path.append(current_user_name)
        current_user_name = shortest_previous_user_table[current_user_name]
    

    shortest_path.append(starting_user.name)
    shortest_path.reverse()
    return shortest_path


print(dijkstra_shortest_path(idris, lina))