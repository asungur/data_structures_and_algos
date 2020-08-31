class TrieNode
	def initialize
		@children = {}
	end
end

class Trie
	def initialize
		@root = TrieNode.new()
  end
  
  def search(word)
    current_node = @root

    word.each_char do |char|
      # If the current node has child key with current character:
      if current_node.children[char]
        # Follow the child node:
        current_node = current_node.children[char]
      else
        # If the current character isn't found among
        # the current node's children, our search word
        # must not be in the trie:
        return nil
      end
    end
    current_node
  end

  def insert(word)
    current_node = @root

    word.each_char do |char|

      # If the current node has child key with current character:
      if current_node.children[char]
        # Follow the child node:
        current_node = current_node.children[char]
      else
        # If the current character isn't found among
        # the current node's children, we add
        # the character as a new child node:
        new_node = TrieNode.new()
        current_node.children[char] = new_node

        # Follow this new node:
        current_node = new_node
      end
    # After inserting the entire word into the trie,
    # we add * key at the end:
    current_node.children["*"] = nil
  end

  def collect_all_words(node=nil, word="", words=[])
    # There are three arguments:
    # node whose descendants we're collecting words from
    # word starts as an empty string and we add chars as we iterate here
    # words array that by the end of the function will contain
    # all the words from the trie.

    # The current node is the node passed in as the first param
    current_node = node || @root

    # Iterate through all the current node's children:
    current_node.children.values.each_pair do |key, child_node|
      # If the current key is *, it means we hit the end of a
      # complete word, so we can add it to tour words array:
      if key == "*"
        words << word
      else
        # If we're still in the middle of a word:
        # We recursively call this function on the child node.
        collect_all_words(child_node, word + key, words)
      end
    end
    words
  end

  def autocomplete(prefix)
    current_node = search(prefix)
    unless current_node
      return nil
    end
    collect_all_words(current_node)
  end
end