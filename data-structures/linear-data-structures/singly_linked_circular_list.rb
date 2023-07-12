# In a circular linked list, all nodes are connected
# There is no NULL at the end. Last element points to the first item
# To traverse the list, we go through all items
# and stop when we encounter the first item again

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class SinglyLinkedCircularList
  attr_accessor :head

  def add(value)
    new_node = Node.new(value)

    # If list is empty, set given value as the head
    # Make the new node point to itself
    if !@head
      new_node.next_node = new_node
      @head = new_node
    else
      # Insert new node after the current head
      # Make its next node point to the head's next node
      new_node.next_node = @head.next_node
      @head.next_node = new_node
      @head.data = new_node.data
      new_node.data = @head.data
    end
  end
end
