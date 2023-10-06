require 'pry'
require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  # i: linked list, hash
  # o: linked list, hash
  # e: if list is empty, if list is one node, is two nodes.
  # q: should this method be destructive
  # given a linkend list reorder it so that the odd nodes are first and followed by the even nodes
  #
  # initialize a new linked list with input list's head as the head
  # starting at the input's head skip over the next node and access the 3rd node.
  #  -before skipping even node check to see if current node has a next property and that next even node has a next property
  #     -if do proceed to next odd node
  #     -add next odd node to new list
  #     - repeat the skipping even node process until end of list.
  # -once at end of the list
  #   -go to head of input and then to the first even node.
  #     -check to see if current node has a next property and that next even node has a next property
  #     -add next even node to new list
  #     - repeat the skipping odd nodes until end of list.
  #
  # -return new linked list
  def reorder_linked_list
    return if head.nil?

    odd = head
    even = head.next_node

    even_head = even

    while even && even.next_node
      odd.next_node = even.next_node
      odd = odd.next_node
      even.next_node = odd.next_node
      even = even.next_node
      # binding.pry
    end

    odd.next_node = even_head
  end
end

head = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5)))))
linked_list = LinkedList.new(head)
# binding.pry
linked_list.reorder_linked_list
