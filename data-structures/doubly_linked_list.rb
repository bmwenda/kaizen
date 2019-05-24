# A doubly linked list is a linear data structure
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
end
