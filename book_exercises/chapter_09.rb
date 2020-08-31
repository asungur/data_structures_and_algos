# 1. If you were writing software for a call center that places callers on hold and then assigns them to “the next available representative,” would you use a stack or a queue?

# QUEUE


# 2. If you pushed numbers onto a stack in the following order: 1, 2, 3, 4, 5, 6, and then popped two items, which number would you be able to read from the stack?

# 4


# 3. If you inserted numbers into a queue in the following order: 1, 2, 3, 4, 5, 6, and then dequeued two items, which number would you be able to read from the queue?

# 3

# 4. Write a function that uses a stack to reverse a string. (For example, "abcde" would become "edcba".) You can work with our earlier implementation of the Stack class.

class Stack
  def initialize
    @data = []
  end
  def push(element)
    @data << element
  end
  def pop
    @data.pop
  end
  def read
    @data.last
  end
end

def reverser(str)
  stack = Stack.new
  reversed_str = ''

  str.each_char { |c| stack.push(c) }

  while stack.read
    reversed_str << stack.pop
  end

  reversed_str
end

# p reverser("abcde")