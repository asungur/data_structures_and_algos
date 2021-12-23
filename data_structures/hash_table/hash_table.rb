class HashTable
  def initialize
    @table = Array.new(9999, nil)
  end

  def calculate_hash_code(str)
    val = str[0].ord * 100 + str[1].ord
    val
  end

  def store(str)
    hash_value = calculate_hash_code(str)

    if @table[hash_value] != nil
      # COLLISION
      @table[hash_value].append(str)
    else
      @table[hash_value] = [str]
    end
  end

  def lookup(str)
    hash_value = calculate_hash_code(str)

    if @table[hash_value] != nil
      return hash_value if @table[hash_value].include?(str)
    end
    # NOT FOUND
    nil
  end
end

people_hash = HashTable.new

puts people_hash.calculate_hash_code("Tom")
puts people_hash.calculate_hash_code("Jon")
puts people_hash.calculate_hash_code("Jane")
puts people_hash.calculate_hash_code("Elrond")

puts people_hash.store("Tom")
puts people_hash.store("Jon")
puts people_hash.store("Jane")
puts people_hash.store("Elrond")

puts people_hash.lookup("Tom")
puts people_hash.lookup("Jon")
puts people_hash.lookup("Jane")
puts people_hash.lookup("Elrond")
