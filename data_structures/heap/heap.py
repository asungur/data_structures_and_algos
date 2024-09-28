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

    def insert(self, value):
        # Turn the value into the last node by inserting at the end:
        self.data.append(value)

        # Fetch new node index:
        new_node_index = len(self.data) - 1

        # Trickle up algorithm:
        # Iterate until the new node is either in root or it's lesser than its parent node:
        while new_node_index > 0 and self.data[new_node_index] > self.data[self.parent_index(new_node_index)]:
            # Swap new node with parent:
            self.data[self.parent_index(new_node_index)], self.data[new_node_index] = self.data[new_node_index],  self.data[self.parent_index(new_node_index)]
            # Update the node index:
            new_node_index = self.parent_index(new_node_index)

