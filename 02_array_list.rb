class ArrayList

  def initialize(*args)
    @array = []
    @last_index = 0
    (args.length * 2).times do |idx|
      if !!args[idx]
        @array << args[idx]
        @last_index += 1
      else
        @array << nil
      end
    end
  end

  def add(item)
    @array.length.times { |_| @array << nil } if @array[-1] != nil

    @array[@last_index] = item
    @last_index += 1
  end

  def length
    @array.length
  end

  alias size length

  def to_s
    @array.to_s
  end
end

sizeable_arr = ArrayList.new(3, 5, 6, 7, 8)

p sizeable_arr.size
p sizeable_arr.length

6.times { |val| sizeable_arr.add(val) }

puts sizeable_arr

