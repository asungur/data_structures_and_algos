class Heap:
    def __init__(self):
        self.data = []
    
    def root_node(self):
        return self.data[0]
    
    def last_node(self):
        return self.data[-1]

    def left_child_index(self, initial_node_index):
        return (initial_node_index * 2) + 1

    def right_child_index(self, initial_node_index):
        return (initial_node_index * 2) + 2

    def parent_index(self, initial_node_index):
        return (initial_node_index - 1) / 2

