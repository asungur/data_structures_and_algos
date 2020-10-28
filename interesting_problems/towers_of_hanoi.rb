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

class Tower
  attr_reader :disks

  def initialize
    @disks = Stack.new()
  end

  def add(disk)
    if (!@disks.is_empty? && @disks.peek <= disk)
      puts "Error placing disk #{disk}"
    else
      @disks.push(disk)
    end
  end

  def move_top_to(tower)
    top = @disks.pop
    tower.add(top)
  end

  def move_disks(quantity, destination_tower, buffer_tower)
    return if (quantity <= 0)

    move_disks(quantity - 1, buffer_tower, destination_tower)
    move_top_to(destination_tower)
    buffer_tower.move_disks(quantity - 1, destination_tower, self)
  end
end

origin = Tower.new()
5.times { |i| origin.add(5 - i) }

buffer = Tower.new()
target = Tower.new()

p target.disks

origin.move_disks(5, target, buffer)

p target.disks


# LOGIC:

# Base case(2 disks): If we have two disks and two empty towers, we can move the two disks from origin to destination by using the other tower as a buffer

# 1. Move one disk to buffer (use destination as buffer)
# 2. Move the other disk to the destination
# 3. Move the other disk that is in the buffer to destination (use origin as buffer)

# Recursion: for three disks, we know that we can move the top two disks can be moved to a destination

# So we can repeat the above steps

# 1. Move two disks to buffer
# 2. Move the third disk to destination
# 3. Move two disks two destination

# ...

# This logic repeats recursively.

