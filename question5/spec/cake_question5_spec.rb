require 'spec_helper'
require_relative '../lib/cake_question5.rb'

RSpec.describe 'Interview Cake Question 5' do

  describe 'Imagine you landed a new job as a cashier...' do
    it 'gives back the numer of ways you can make change' do
      expect(change_possibilities_top_down(4,[1,2,3])).to eq 4
    end

    it 'works when memoizing too' do
      expect(Change.new.change_possibilities_top_down(800,[1,5,10,25,100]))
    end

    it 'gives back the numer of ways you can make change', focus: true do
      expect(change_possibilities_bottom_up(800,[1,5,10,25,100])).to eq 191805
    end

    it 'works with a bottom-up approach to', focus: true do
      expect(change_possibilities_bottom_up(4, [1,2,3])).to eq 4
    end

    it 'works with a bottom-up approach to', focus: true do
      expect(change_possibilities_bottom_up(5, [1,3,5])).to eq 3
    end
  end
end
