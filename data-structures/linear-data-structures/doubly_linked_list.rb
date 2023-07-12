# Each node contains:
#   - reference to the next node
#   - reference to the previous node
#   - data
# Address for the previous node of the first element is NULL
# Address for the next node of the last of the last element is NULL

class Node
  attr_accessor :previous_node, :next_node

  def initialize(data, previous_node = nil, next_node = nil)
    @data = data
    @previous_node = previous_node
    @next_node = next_node
  end
end

class DoublyLinkedList
  attr_accessor :head

  def initialize(head)
    @head = Node.new(head)
  end

  # Inserting node at the front of the list
  def head_insertion(value)
    new_node = Node.new(value)

    new_node.previous_node = nil
    new_node.next_node = head

    head.previous_node = new_node
    self.head = new_node
  end

  # Inserting new node after a given node
  def after_node_insertion(previous_node, new_data)
    return unless previous_node

    new_node = Node.new(new_data)

    new_node.previous_node = previous_node
    new_node.next_node = previous_node.next_node

    previous_node.next_node = new_node
    new_node.next_node.previous_node = new_node if new_node.next_node
  end

  # Inserting new node at the end of the list
  def tail_insertion(value)
    current = head
    new_node = Node.new(value)

    while !current.next_node.nil?
      current = current.next_node
    end
    new_node.previous_node = current
    current.next_node = new_node
  end

  def items
    current = head
    elements = []
    while !current.next_node.nil?
      elements << current
      current = current.next_node
    end
    elements << current
  end

  def reverse_traversal
    current = head
    elements = []
    while !current.previous_node.nil?
      elements << current
      current = current.previous
    end
    elements << current
  end
end
