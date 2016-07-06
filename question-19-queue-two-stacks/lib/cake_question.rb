require 'pry-byebug'

class QueueFromTwoStacks
  attr_reader :in_stack, :out_stack, :head, :tail

  def initialize(first_value = nil)
    node = Node.new(first_value) if first_value
    @head = node
    @tail = node
    @in_stack = Stack.new
    @out_stack = Stack.new

    in_stack.push(node) if node
  end

  def enqueue(node)
    in_stack.push(node)
    if empty?
      @head = node
    end
    @tail = node
  end

  def dequeue
    if in_stack.peek == tail
      while in_stack.peek != head
        out_stack.push(in_stack.pop)
      end
      @head = out_stack.peek
      return in_stack.pop
    elsif out_stack.peek == head
      node = out_stack.pop
      @head = node.next_node
      return node
    end
  end

  def empty?
    @head.nil?
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  def to_s
    @value || nil
  end
end

class Stack
  attr_accessor :head

  def initialize(node = nil)
    @head = node if node
  end

  def push(node)
    node.next_node = @head
    @head = node
  end

  def pop
    node = @head
    @head = node.next_node
    node
  end

  def peek
    @head
  end
end
