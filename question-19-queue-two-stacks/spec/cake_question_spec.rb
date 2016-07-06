require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question 19' do

  let(:queue) { QueueFromTwoStacks.new }
  let(:stack) { Stack.new }

  describe 'Stack' do
    before :each do
      stack.push(Node.new(1))
      stack.push(Node.new(2))
      stack.push(Node.new(3))
      stack.push(Node.new(4))
      stack.push(Node.new(5))
      stack.push(Node.new(6))
    end

    it 'pushes values onto the stack' do
      expect(stack.peek.value).to eq 6
    end

    it 'pops the nodes off and returns the node' do
      
      node = stack.pop
      expect(stack.peek.value).to eq 5
      expect(stack.peek.next_node.value).to eq 4
      expect(node.value).to eq 6
      expect(node.next_node.value).to eq 5

      node = stack.pop
      expect(stack.peek.value).to eq 4
      expect(stack.peek.next_node.value).to eq 3
      expect(node.value).to eq 5
      expect(node.next_node.value).to eq 4

      node = stack.pop
      expect(stack.peek.value).to eq 3
      expect(stack.peek.next_node.value).to eq 2
      expect(node.value).to eq 4
      expect(node.next_node.value).to eq 3
    end
  end

  describe 'Implement a queue with 2 stacks' do
    describe '#enqueue' do
      it 'implements enqueue' do
        queue.enqueue(Node.new(1))
        expect(queue.in_stack.head.value).to eq 1
      end

      it 'stacks on the in_stack until a dequeue is called' do
        queue.enqueue(Node.new(1))
        queue.enqueue(Node.new(2))
        expect(queue.in_stack.peek.value).to eq 2
        expect(queue.head.value).to eq 1
        expect(queue.tail.value).to eq 2
      end

      it 'stacks on the in_stack until a dequeue is called' do
        queue.enqueue(Node.new(1))
        queue.enqueue(Node.new(2))
        queue.enqueue(Node.new(3))
        expect(queue.head.value).to eq 1
        expect(queue.tail.value).to eq 3
        expect(queue.out_stack.peek).to be_nil
      end
    end

    describe 'dequeue' do
      before :each do
        queue.enqueue(Node.new(1))
        queue.enqueue(Node.new(2))
        queue.enqueue(Node.new(3))
        queue.enqueue(Node.new(4))
        queue.enqueue(Node.new(5))
      end

      it 'moves the stack over to the out stack when dequeue is called' do
        node = queue.dequeue
        expect(queue.out_stack.peek.value).to eq 2
        expect(node.value).to eq 1

        node = queue.dequeue
        expect(node.value).to eq 2
        expect(queue.out_stack.peek.value).to eq 3
      end
    end
  end
end
