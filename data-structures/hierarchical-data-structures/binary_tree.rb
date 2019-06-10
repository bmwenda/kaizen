# Terminologies:
#   root      - top most node
#   children  - elements directly below an element
#   leaves    - elements with no children
#
# A b-tree is a tree whose elements have at most two children
# The children are named left child and right child

class Node
  attr_reader :value
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

  # root->left->right order
  # Recursively traverse left subtree from root up to the left most leaf
  # Traverse back to last parent with a right child
  # Repeat steps 1 and 2 until all nodes have been covered
  # Traverse back up to root and repeat for right subtree
  def preorder(node)
    # 1->2->4->5->3->6
    if node
      print node.value.to_s + '->'
      preorder(node.left_child)
      preorder(node.right_child)
    end
  end

  # left->root->right order
  def inorder(node)
    # 4->2->5->1->6->3
    if node
      inorder(node.left_child)
      print node.value.to_s + '->'
      inorder(node.right_child)
    end
  end

  # left->right->root
  def postorder(node)
    # 4->5->2->6->3->1
    if node
      postorder(node.left_child)
      postorder(node.right_child)
      print node.value.to_s + '->'
    end
  end
end
