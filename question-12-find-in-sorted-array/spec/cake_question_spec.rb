require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question 12 Find in ordered set' do
  describe 'how quickly we can find an integer in a sorted array' do
    it 'does it using binary search' do
      a = *1..100
      expect(binary_search(67, a)).to eq true
    end

    it 'does it using binary search' do
      a = *1..3756
      expect(binary_search(98765, a)).to eq false
    end

    it 'does it using binary search' do
      a = *1..1_000_000
      expect(binary_search(1_000_001, a)).to eq false
    end

    it 'works with recursive binary search too' do
      a = *1..100
      expect(recursive_binary_search(67, a)).to eq 67
    end

    it 'works with recursive binary search too' do
      a = *1..500
      expect(recursive_binary_search(477, a)).to eq 477
    end

    it 'works with recursive binary search too' do
      a = *1..1_000_000
      expect(recursive_binary_search(239_478, a)).to eq 239_478
    end
  end
end
