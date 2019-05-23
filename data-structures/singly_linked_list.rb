# A singly linked list is a linear data structure
# each element is an object (node) comprising of:
#   - data (value of the element)
#   - a reference to the next item
# the next address reference for the last item is NULL

# Constructor for node containing data and next address reference
class Node
  attr_accessor :next_item

  def initialize(data, next_item = nil)
    @data = data
    @next_item = next_item
  end
end

# Linked list
class LinkedList
  attr_accessor :head

  # Starting point for the list (head)
  def initialize(head)
    @head = Node.new(head)
  end

  def add(value)
    current_item = head

    # Traverse through the list until we find the last item
    while !current_item.next_item.nil?
      current_item = current_item.next_item
    end
    # Add the new node at the end of the list
    current_item.next_item = Node.new(value)
  end

  def items
    elements = []
    current_item = head
    while !current_item.next_item.nil?
      elements << current_item
      current_item = current_item.next_item
    end
    elements << current_item
  end
end
