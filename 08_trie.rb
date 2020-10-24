class TrieNode
  def initialize
    @children = {}
  end
end

class Trie
  def initialize
    @root = TrieNode.new()
  end

  def insert(word)
    current_node = @root

    word.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]

      else
        new_node = TrieNode.new()
        current_node.children[char] = new_node

        current_node = new_node
      end


    end
    current_node.children["*"] = nil
  end

  def search(word)
    current_node = @root

    word.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]
      else
        return nil
      end
    end
    current_node
  end

end