# Implement an algorithm to print all valid combinations of n pairs of paranthesis.

# n = 1
#  ()

# n = 2
#   ()(), (())
#     A     B
# n = 3

#   ()()(), (())(), ()(()),  (()()), ((())) 
#     A       A        A      B        B

# This is a combinatorial problem. We can start with a method like
# parans( parantheses_to_open = 3, parantheses_to_close = 0, string = "")

# At each recursive step has two subproblems:
# 1st, we can open a paranthesis and call the same method with one less "(" and one more ")":
# parans( parantheses_to_open = 2, parantheses_to_close = 1, string = "")
# 2nd, we can close the paranthesis and call the same method with one less ")"
# This wont be valid at the beginning but work later down the line.

  #                           (3, 0, "")
  #                   (2,1,"(")         
  #           (1,2,"((")     (2,0,"()")
  # (0,2,"(((")  (1,1,"(()") (1,1,"()(")
  # .
  # .
  # . 

  def parans(open_count, closed_count, string)
    if (open_count == 0 && closed_count == 0)
      puts string
    end
    if open_count > 0
      parans(open_count - 1, closed_count + 1, string + "(")
    end
    if closed_count > 0
      parans(open_count, closed_count - 1, string + ")")
    end
  end
  
  parans(3, 0, "")
  
  
  