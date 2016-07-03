require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question 14 Inflight Entertainment' do

  describe 'takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes)' do
    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(120, [60,60])).to eq true
    end

    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(124, [60,60])).to eq false
    end

    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(124, [60,64])).to eq true
    end

    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(120, [59,61,90,30])).to eq true
    end

    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(256, [60,60,97,135])).to eq false
    end

    it 'returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length' do
      expect(inflight(120, [60,123,90,70])).to eq false
    end
  end
end
