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

root = Node.new(1)
root.left_child = Node.new(2)
root.right_child = Node.new(3)

# creates a tree as below
#                1
#              /   \
#            2       3
#          /   \    /  \
#        nil   nil nil nil

root.left_child.left_child = Node.new(4)
# resulting tree

#                1
#              /   \
#            2       3
#           /  \    /  \
#         4    nil nil  nil
#        / \
#      nil nil
