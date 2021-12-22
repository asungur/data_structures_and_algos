# A CHILD IS RUNNING UP A STAIRCASE WITH N STEPS AND CAN HOP EITHER 1 STEP, 2 STEPS OR 3 STEPS AT A TIME. IMPLEMENT A METHOD TO COUNT HOW MANY POSSIBLE WAYS THE CHILD CAN RUN UP THE STAIRS.

def n_steps(total, memo={})
  # BASE CASES WHERE NO STEPS LEFT 
  return 0 if total < 0
  return 1 if total == 0

  # RETURN MEMO RECORD IF THERE IS ANY
  return memo[total] if !!memo[total]

  
  memo[total] = n_steps(total - 1, memo) + n_steps(total - 2, memo) + n_steps(total - 3, memo)
  
  return memo[total]
end

p n_steps(stairs_length)