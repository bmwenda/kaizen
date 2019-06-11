# A BST is a binary tree structure
# It has these properties
#   - Left subtree of a node has a key less than it's parent key
#   - Left subtree of a node has a key less than it's parent key
#   - There are no duplicates

#   left_subtree(keys) < node(key) < right_subtree(keys)

class Node
  attr_reader :value
  attr_accessor :left_child, :right_child

  def initialize(value)
    @right_child = nil
    @left_child = nil
    @value = value
  end
end

class BST
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if root.nil?
      @root = Node.new(value)
    else
      perform_insertion(value, root)
    end
  end

  def perform_insertion(value, current_node)
    if value < current_node.value
      if current_node.left_child.nil?
        current_node.left_child = Node.new(value)
      else
        perform_insertion(value, current_node.left_child)
      end
    elsif value > current_node.value
      if current_node.right_child.nil?
        current_node.right_child = Node.new(value)
      else
        perform_insertion(value, current_node.right_child)
      end
    else
      p 'Duplicates are not allowed'
    end
  end

  def found?(value)
    return false unless root

    if search(value, root)
      true
    else
      false
    end
  end

  private

  def search(value, next_node)
    return value if value == next_node.value

    if value < next_node.value && next_node.left_child
      search(value, next_node.left_child)
    elsif value > next_node.value && next_node.right_child
      search(value, next_node.right_child)
    end
  end
end
