# Terminologies:
#   root      - top most node
#   children  - elements directly below an element
#   leaves    - elements with no children
#
# A b-tree is a tree whose elements have at most two children
# The children are named left child and right child

class Node
  attr_accessor :left_child, :right_child

  def initialize(value)
    @left_child = nil
    @right_child = nil
    @value = value
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(value)
    @root = Node.new(value)
  end

  def construct
    Node.new(1) unless root
    root.left_child = Node.new(2)
    root.right_child = Node.new(3)
    root.left_child.left_child = Node.new(4)
    root.left_child.right_child = Node.new(5)
    root.right_child.left_child = Node.new(6)

    # resulting tree

    #                1
    #              /   \
    #            2       3
    #           /  \    /
    #         4     5  6
  end
end
