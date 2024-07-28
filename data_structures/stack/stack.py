class Stack:
    def __init__(self):
        self.data = []
    
    def push(self, el):
        self.data.append(el)
    
    def pop(self):
        return self.data.pop()
    
    def peek(self):
        return self.data[-1]
    
    def is_empty(self):
        return len(self.data) == 0


stack = Stack()

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

print(stack.pop())
print(stack.peek())

print(stack.is_empty())
