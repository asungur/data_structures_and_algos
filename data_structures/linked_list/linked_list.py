class Node:
    def __init__(self, data):
        self.data = data
        self.next_node = None

class LinkedList:
    def __init__(self, first_node):
        self.first_node = first_node

    def read(self, index):
        current_node = self.first_node
        current_index = 0
        while current_index < index:
            current_node = current_node.next_node
            current_index += 1
            # Return None when out of bounds
            if current_node is None:
                return None
        return current_node.data

    def index_of(self, value):
        current_node = self.first_node
        current_index = 0
        while current_node is not None:
            if current_node.data == value:
                return current_index

            current_node = current_node.next_node
            current_index += 1
        # Return None if data is not found:
        return None

    def insert_at_index(self, index, value):
        new_node = Node(value)
        # Insert at the beginning
        if index == 0:
            new_node.next_node = self.first_node
            self.first_node = new_node
            return
        # Anywhere else:
        current_node = self.first_node
        current_index = 0
        # Move until 1 node before
        while current_index < (index - 1):
            current_node = current_node.next_node
            current_index += 1
        # Put the new node between this node before and the next
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node

    def delete_at_index(self, index):
        # Deleting the first node:
        if index == 0:
            self.first_node = self.first_node.next_node
            return
        # Deleting any other node:
        current_node = self.first_node
        current_index = 0
        # Move until 1 node before
        while current_index < (index - 1):
            current_node = current_node.next_node
            current_index += 1
        node_after_deleted_node = current_node.next_node.next_node
        current_node.next_node = node_after_deleted_node
    def print_all(self):
        current_node = self.first_node
        while current_node is not None:
            print(current_node.data)
            current_node = current_node.next_node

node_1 = Node("once")
node_2 = Node("upon")
node_3 = Node("a")
node_4 = Node("time")
node_1.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4
list = LinkedList(node_1)
# print(list.read(2))
# print(list.insert_at_index(3, "baklava"))
# print(list.index_of("baklava"))
# list.delete_at_index(3)
# print(list.index_of("time"))
list.print_all()
