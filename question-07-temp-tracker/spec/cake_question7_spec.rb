require 'spec_helper'
require_relative '../lib/cake_question7.rb'

RSpec.describe 'Interview Cake Question' do

  let!(:temp_tracker) { TempTracker.new }
1
  describe 'the problem to be solved' do

    before :each do
      temp_tracker.insert(68)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(71)
      temp_tracker.insert(72)
      temp_tracker.insert(74)
      temp_tracker.insert(72)
      temp_tracker.insert(75)
      temp_tracker.insert(81)
      temp_tracker.insert(79)
      temp_tracker.insert(80)
      temp_tracker.insert(83)
      temp_tracker.insert(85)
      temp_tracker.insert(84)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
      temp_tracker.insert(69)
    end

    it 'returns a max' do
      expect(temp_tracker.get_max).to eq 85
    end

    it 'returns the min' do
      expect(temp_tracker.get_min).to eq 68
    end

    it 'gets the mean' do
      expect(temp_tracker.get_mean).to eq 73.57
    end

    it 'gets a mode, if there is one' do
      expect(temp_tracker.get_mode).to eq 69
    end

    it 'gets a mode, if there is one' do
      10.times do
        temp_tracker.insert(72)
      end
      expect(temp_tracker.get_mode).to eq 72
    end
  end
end
