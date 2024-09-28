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

    def delete(self):
        value_to_delete = self.root_node()

        # Make the last node root node
        self.data[0] = self.data.pop()
        trickle_node_index = 0

        # Execute trickle down algo:
        while self.has_greater_child(trickle_node_index):
            # Save larger child index in variable:
            larger_child_index = self.calculate_larger_child_index(trickle_node_index)

            # Swap the trickle node with its larger child:
            self.data[trickle_node_index], self.data[larger_child_index] = self.data[larger_child_index], self.data[trickle_node_index]

            # Update tricle node's new index:
            trickle_node_index = larger_child_index

        return value_to_delete

    def has_greater_child(self, index):
        # Check if there are both left and right child and they are larger:
        return (self.data[self.left_child_index[index]] and self.data[self.left_child_index] > self.data[index]) or (self.data[self.right_child_index(index)] and self.data[self.right_child_index[index] > self.data[index]])

    def calculate_larger_child_index(self, index):
        # Overall, prioritise left direction:
        # If there is not right child.
        if not self.data[self.right_child_index(index)]:
            return self.left_child_index(index)

        # If right child value is greater than left child value:
        if self.data[self.right_child_index(index)] > self.data[self.left_child_index(index)]:
            return self.right_child_index(index)
        else:
            # Left child value is greater or equal to right child:
            return self.left_child_index(index)
