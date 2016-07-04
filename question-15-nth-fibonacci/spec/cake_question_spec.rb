require 'spec_helper'
require_relative '../lib/cake_question'

RSpec.describe 'Interview Cake Question 15: Fibonacci' do

  let(:f) { -> (n) { n == 0 || n == 1 ? n : f[n-1] + f[n-2] }.memoize }

  describe 'Let’s say our fibonacci series is 0-indexed and starts with 0' do
    it 'returns the nth Fibonacci number' do
      expect(fib(3)).to eq 2
    end

    it 'returns the nth Fibonacci number' do
      expect(fib(0)).to eq 0
    end

    it 'returns the nth Fibonacci number' do
      expect(fib(1)).to eq 1
    end

    it 'returns the nth Fibonacci number' do
      expect(fib(2)).to eq 1
    end

    it 'returns the nth Fibonacci number' do
      expect(fib(4)).to eq 3
    end
  end

  describe 'the lambda works too' do
    it 'returns the nth Fibonacci number' do
      expect(f.call(3)).to eq 2
    end
  end

  describe 'the lambda works too' do
    it 'returns the nth Fibonacci number' do
      expect(fibonacci(3)).to eq 2
    end

    it 'returns the nth Fibonacci number' do
      expect(fibonacci(4)).to eq 3
    end

    it 'returns the nth Fibonacci number' do
      expect(fibonacci(5)).to eq 5
    end

    it 'returns the nth Fibonacci number' do
      expect(fibonacci(6)).to eq 8
    end
  end
end
