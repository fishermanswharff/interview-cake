require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question 13 Find Rotation Point' do

  let(:words) {
    [
      'ptolemaic',
      'retrograde',
      'supplant',
      'undulate',
      'xenoepist',
      'asymptote', # <-- rotates here!
      'babka',
      'banoffee',
      'engender',
      'karpatka',
      'othellolagkage',
    ]
  }
  let(:letters){ [ 'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','a','b','c','d','e','f','g','h','i','j' ] }
  let(:unrotated) {
    [
      'asymptote', # <-- rotates here!
      'babka',
      'banoffee',
      'engender',
      'karpatka',
      'othellolagkage',
      'ptolemaic',
      'retrograde',
      'supplant',
      'undulate',
      'xenoepist',
    ]
  }
  describe 'I want to learn some big words so people think I’m smart.' do
    it 'finds the rotation point of the array' do
      expect(rotation_point(words)).to eq 5
    end

    it 'finds the rotation point of the array' do
      expect(rotation_point(letters)).to eq 16
    end

    it 'finds the rotation point of the array' do
      expect(recursive_rotation_point(words)).to eq 'asymptote'
    end

    it 'finds the rotation point of the array' do
      expect(recursive_rotation_point(letters)).to eq 'a'
    end

    it 'returns 0 if the array is not rotated' do
      expect(rotation_point(unrotated)).to eq 0
    end

    it 'returns the item at the index if the array is not rotated' do
      expect(recursive_rotation_point(unrotated)).to eq 'asymptote'
    end
  end
end
