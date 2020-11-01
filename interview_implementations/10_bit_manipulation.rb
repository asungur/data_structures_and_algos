def get_bit(n, i)
  (n & (1 << i) != 0)
end

def set_bit(n, i)
  (n | (1 << i))
end

def clear_bit(n, i)
  mask = ~(1 << i)
  n & mask
end

def clear_i_bits(n, i)
  mask = (1 << i) - 1
  mask & n
end

def update_bit(n, i, v)
  val = v == 1 ? true : false
  mask = ~(1 << i)
  (num & mask) | (value << i)
end