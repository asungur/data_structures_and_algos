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

puts people_hash.calculate_hash_code("Alican")
puts people_hash.calculate_hash_code("Beril")
puts people_hash.calculate_hash_code("Gul")
puts people_hash.calculate_hash_code("Sabri")

puts people_hash.store("Alican")
puts people_hash.store("Beril")
puts people_hash.store("Gul")
puts people_hash.store("Sabri")

puts people_hash.lookup("Alican")
puts people_hash.lookup("Beril")
puts people_hash.lookup("Gul")
puts people_hash.lookup("Sabri")