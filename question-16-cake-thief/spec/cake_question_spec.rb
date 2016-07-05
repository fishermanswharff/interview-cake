require 'spec_helper'
require_relative '../lib/cake_question.rb'

RSpec.describe 'Interview Cake Question' do

  describe 'max_duffel_bag_value' do
    it 'returns the maximum monetary value the duffel bag can hold' do
      expect(max_duffel_bag_value([[1,100],[3,90],[2,15]],1)).to eq 100
    end

    it 'returns the maximum monetary value the duffel bag can hold' do
      expect(max_duffel_bag_value([[7,160],[3,90],[2,15]],20)).to eq 555
    end

    it 'returns the maximum monetary value the duffel bag can hold' do
      expect(max_duffel_bag_value([[3,40],[5,70]],8)).to eq 110
    end

    it 'returns the maximum monetary value the duffel bag can hold' do
      expect(max_duffel_bag_value([[3,40],[5,70]],9)).to eq 120
    end

    it 'works when a cake weighs nothing and has 0 value too' do
      expect(max_duffel_bag_value([[0,49], [7,160]], 7)).to eq Float::INFINITY
    end
  end
end
