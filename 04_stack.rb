class Stack
  def initialize
    @values = []
  end

  def pop
    @values.shift
  end

  def push(item)
    @values.unshift(item)
  end

  def peek
    @values[0]
  end

  def is_empty?
    !@values[0]
  end
end

stack = Stack.new()

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

p stack.pop
p stack.peek
p stack.is_empty?