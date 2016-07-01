require 'spec_helper'
require_relative '../lib/cake_question'

RSpec.describe BinaryTreeNode do

  let(:bt) { -> (name, value) { bt = BinaryTreeNode.new(name, value) } }
  let(:root) { bt.call('A', 50) }

  before :each do
    root.insert('B', 40)
    root.insert('C', 60)
    root.insert('D', 49)
    root.insert('E', 48)
    root.insert('F', 51)
    root.insert('G', 39)
    root.insert('H', 38)
    root.insert('I', 37)
  end

  describe '.new' do
    it 'creates a new Binary Tree' do
      expect(root.value).to eq 50
    end
  end

  describe '#insert' do
    it 'inserts a new node' do
      expect(root.left_branch.value).to eq 40
      expect(root.left_branch.right_branch.value).to eq 49
      expect(root.right_branch.value).to eq 60
      expect(root.left_branch.right_branch.left_branch.value).to eq 48
      expect(root.left_branch.left_branch.value).to eq 39
    end
  end

  skip describe '#destroy' do
    it 'destroys the node' do
      expect(root.destroy(50)).to eq true
    end
  end

  describe '#find' do
    it 'returns the matching node' do
      expect(root.find(49).left_branch.value).to eq 48
    end

    it 'returns self if the value equals the root value' do
      expect(root.find(50).value).to eq 50
    end
  end

  describe '#dfs' do
    it 'Outputs: All vertices reachable from vertex labeled as discovered' do
      # expect(root.dfs(39)).to be_a BinaryTreeNode
      # expect(root.dfs(39)).to eq #<BinaryTreeNode:0x007f98e2ad6538 @left_branch=nil, @name="thirty-nine", @observed=true, @right_branch=nil, @value=39>
    end
  end

  describe '#is_balanced?' do
    it 'returns true if the difference between the depths of any two leaf nodes is no greater than one.' do
      expect(root.is_balanced?(root)).to eq true
    end
  end

  describe '#valid_bst?', :focus do
    it 'returns true if The node’s value is greater than all values in the left subtree, and The node’s value is less than all values in the right subtree.' do
      expect(root.valid_bst?).to eq true
    end

    it 'returns false unless a node is in a valid place relative to its ancestors' do
      node = root.find(37)
      node.insert('J', 60)
      expect(root.valid_bst?).to eq false
    end
  end

  describe '#second_largest_node' do
    it 'returns the node with the second largest value in the binary search tree' do
      expect(root.second_largest_node.value).to eq 51
    end

    it 'returns the node with the second largest value in the binary search tree' do
      node = root.find(60)
      node.insert('J', 64)
      expect(root.second_largest_node.value).to eq 60
    end
  end
end













