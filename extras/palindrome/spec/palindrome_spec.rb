require 'spec_helper'
require_relative '../lib/palindrome'

RSpec.describe 'Palindromes' do
  describe '#is_palindrome?' do
    it 'returns true if the word is the same forwards as backwards' do
      expect(is_palindrome?('poop')).to eq true
      expect(is_palindrome?('mother')).to eq false
      expect(is_palindrome?('POop')).to eq false
      expect(is_palindrome?('racecar')).to eq true
    end
  end
end