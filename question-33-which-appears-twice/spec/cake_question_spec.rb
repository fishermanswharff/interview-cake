require 'spec_helper'
require_relative '../lib/cake_question_33_which_appears_twice'

RSpec.describe 'Interview Cake Question 33' do

  describe 'which appears twice' do
    it 'finds the number in an array which appears twice' do
      expect(dupe([1,2,3,4,5,6,7,8,9,1])).to eq 1
    end

    it 'finds the number in an array which appears twice' do
      a = *1..3456
      a.push(455)
      expect(dupe(a)).to eq 455
    end
  end
end
