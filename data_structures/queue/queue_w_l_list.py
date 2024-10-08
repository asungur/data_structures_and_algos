class Node:
    def __init__(self, data):
        self.data = data
        self.next_node = None
        self.previous_node = None

class DoublyLinkedList:
    def __init__(self, first_node=None, last_node=None):
        self.first_node = first_node
        self.last_node = last_node

    def insert_at_end(self, value):
        new_node = Node(value)

        # Edge case. No elements in the list:
        if self.first_node is None:
            self.first_node = new_node
            self.last_node = new_node
        else:
            new_node.previous_node = self.last_node
            self.last_node.next_node = new_node
            self.last_node = new_node

    def remove_from_front(self):
        removed_node = self.first_node
        self.first_node = self.first_node.next_node
        return removed_node

class Queue:
    def __init__(self):
        self.queue = None
        self.data = DoublyLinkedList()

    def enqueue(self, element):
        self.data.insert_at_end(element)

    def dequeue(self):
        removed_node = self.data.remove_from_front()
        return removed_node.data

    def read(self):
        if self.data.first_node is None:
            return None
        return self.data.first_node.data
