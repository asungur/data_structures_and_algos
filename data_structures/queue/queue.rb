class Queue
  def initialize
    @values = []
  end

  def add(item)
    @values << item
  end

  def remove
    @values.shift
  end

  def peek
    @values[0]
  end

  def is_empty?
    !@values[0]
  end
end

queue = Queue.new

queue.add(1)
queue.add(2)
queue.add(3)
queue.add(4)
queue.add(5)

p queue.remove

p queue.peek

p queue.is_empty?
