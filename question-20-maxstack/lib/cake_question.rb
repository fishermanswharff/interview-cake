require 'pry-byebug'

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

  def initialize(first_value = nil)
    @head = Node.new(first_value) if first_value
  end

  def push(value)
    node = Node.new(value)
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

class MaxStack < Stack

  attr_reader :maxes

  def initialize(value)
    @maxes = []
    super(value)
  end

  def push(value)
    node = Node.new(value)
    node.next_node = @head
    if @head && node.value > @head.value
      @maxes.push(node)
    end
    @head = node
  end

  def pop
    node = @head
    @head = node.next_node
    if node == @maxes[-1]
      @maxes.pop
    end
    node
  end

  def getmax
    return @maxes[-1]
  end
end
