# TOP - DOWN,
# BOTTOM - UP,
# HALF - HALF APPROACHES

# RECURSION VS ITERATION

# DYNAMIC PROGRAMMING vs MEMOIZATION

# FIBONACCI - BOTTOM UP
# LOT OF REPEATED CALLS, ADDITIONAL LOAD ON THE MEMORY BY CALLING A NEW STACK
# O(2^N) RUN TIME
# def fibonacci(n)
#   return 0 if n == 0
#   return 1 if n == 1
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# FIBONACCI - MEMOISATION USING A HASH TABLE
# TOP-DOWN DYNAMIC PROGRAMMING
# O(N) runtime
def fibonacci(n, memo = {})
  return n if (n == 0 || n == 1)

  unless memo[n]
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
  end
  
  memo[n]
end

# FIBONACCI - BOTTOM UP DYNAMIC PROGRAMMING
def fibonacci_b(n)
  return 0 if n == 0
  return 1 if n == 1

  memo = []
  memo[0] = 0
  memo[1] = 1
  i = 2
  while i < n
    memo[i] = memo[i - 1] + memo[i - 2]
    i += 1
  end
  memo[n - 1] + memo[n - 2]
end
