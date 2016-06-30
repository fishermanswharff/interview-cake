require 'pry'
require 'byebug'

class BinaryTreeNode
  attr_accessor :name, :value, :observed
  attr_reader :right_branch, :left_branch

  def initialize(name, value)
    @value = value
    @name = name
    @left_branch = nil
    @right_branch = nil
  end

  def insert(name, value)
    if value > @value
      @right_branch ? @right_branch.insert(name, value) : @right_branch = BinaryTreeNode.new(name, value)
    elsif value < @value
      @left_branch ? @left_branch.insert(name, value) : @left_branch = BinaryTreeNode.new(name, value)
    else
      'world ends'
    end
  end

  def find(value_to_find, node = self)
    if node.nil? || node.value == value_to_find
      return node
    elsif value_to_find < node.value
      find(value_to_find, node.left_branch)
    else value_to_find > node.value
      find(value_to_find, node.right_branch)
    end
  end

  def children
    [left_branch, right_branch].compact
  end

  def dfs(node = self)
    node.observed = true
    for child in node.children
      dfs(child)
    end
  end

  def valid_bst?(node = self)
    stack = []
    stack.push([node, -Float::INFINITY, Float::INFINITY])
    while !stack.empty?
      puts stack
      node, lower_bounds, upper_bounds = stack.pop
      if node.value < lower_bounds || node.value > upper_bounds
        return false
      end
      if node.left_branch
        stack.push([node.left_branch, lower_bounds, node.value])
      end
      if node.right_branch
        stack.push([node.right_branch, node.value, upper_bounds])
      end
    end
    return true
  end

  def is_balanced?(node = self)
    depths = []
    nodes = []
    nodes.push([node,0])
    while !nodes.empty?
      node, depth = nodes.pop
      if !node.left_branch || !node.right_branch
        if !depths.include? depth
          depths.push(depth)
          if (depths.length > 2) || (depths.length == 2 && (depths[0] - depths[1]).abs > 1)
            return false
          end
        end
      else
        if node.left_branch
          nodes.push([node.left_branch, depth + 1])
        end
        if node.right_branch
          nodes.push([node.right_branch, depth + 1])
        end
      end
    end
    return true
  end

  def destroy(value)
  end
end
