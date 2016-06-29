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

=begin
1  procedure DFS(G,v):
2      label v as discovered
3      for all edges from v to w in G.adjacentEdges(v) do
4          if vertex w is not labeled as discovered then
5              recursively call DFS(G,w)
=end

  def destroy(value)
  end
end
