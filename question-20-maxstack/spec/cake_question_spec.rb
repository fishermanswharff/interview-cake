require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question Question 20' do

  let(:maxstack) { MaxStack.new(nil) }

  describe 'MaxStack' do

    before :each do
      (1..26).each do |num|
        maxstack.push(num)
      end
    end

    it 'returns the max value in the stack' do
      node = maxstack.getmax
      expect(node.value).to eq 26
    end

    it 'returns the max value in a stack' do
      maxstack.pop
      node = maxstack.getmax
      expect(node.value).to eq 25
    end
  end
end
