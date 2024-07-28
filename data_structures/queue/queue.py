class Queue:
    def __init__(self):
        self.data = []
    
    def add(self, item):
        self.data.append(item)
    
    def remove(self):
        return self.data.pop(0)
    
    def peek(self):
        return self.data[0]
    
    def is_empty(self):
        return not self.data

queue = Queue()

queue.add(1)
queue.add(2)
queue.add(3)
queue.add(4)
queue.add(5)

print(queue.remove())
print(queue.peek())
print(queue.is_empty())
