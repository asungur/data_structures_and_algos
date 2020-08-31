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

class Linter
  def initialize
    @stack = Stack.new
  end

  def lint(text)
    #Read each char in the text
    text.each_char do |char|

      if is_opening_brace?(char)

        @stack.push(char)

      elsif is_closing_brace?(char)

        popped_opening_brace = @stack.pop

        if !popped_opening_brace
          return "#{char} doesn't have opening brace"
        end

        if is_not_a_match(popped_opening_brace, char)
          return "#{char} has mismatched opening brace"
        end
      end
    end

    # if we get here and the stack is not empty:
    if @stack.read

      return "#{stack.read} does not have closing brace"
    end

    # return true if no errors
    return true
  end

  def is_opening_brace?(char)
    ["(", "[", "{"].include?(char)
  end

  def is_closing_brace?(char)
    [")", "]", "}"].include?(char)
  end

  def is_not_a_match(opening_brace, closing_brace)
    closing_brace != {"(" => ")", "[" => "]", "{" => "}"}[opening_brace]
  end
end

# linter = Linter.new
# puts linter.lint("( var x = { y: [1, 2, 3] } )")