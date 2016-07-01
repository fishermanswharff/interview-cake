require 'spec_helper'
require_relative '../lib/cake_q1.rb'

RSpec.describe 'Best profit from stock prices yesterday' do

  let(:stock_prices_yesterday){ [490,489,487,488,475,489,450,490,491,492,493,494,497,500,467,490,504,506,508,497,499,520,534,576,587,599,620,602,604,603,587,596,595,593,591,540] }
  let(:stock_prices_2) { [10, 7, 5, 8, 11, 9] }
  let(:steady_prices) { [2,2,2,2,2,2,2,2,2,2,2] }
  let(:falling_prices) { [10,9,8,7,6,5,4,3,2,1] }

  describe '#get_best_profit' do
    it 'returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday' do
      expect(get_best_profit(stock_prices_yesterday)).to eq 170
    end

    it 'returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday' do
      expect(get_best_profit(stock_prices_2)).to eq 6
    end

    it 'returns 0 if the stock prices do not change' do
      expect(get_best_profit(steady_prices)).to eq 0
    end

    it 'returns the least amount we would have lost if max profit was negative' do
      expect(get_best_profit(falling_prices)).to eq(-1)
    end
  end
end
