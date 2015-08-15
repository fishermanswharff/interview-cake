require 'spec_helper'
require_relative '../lib/cake_q1.rb'

RSpec.describe 'Best profit from stock prices yesterday' do

  let(:stock_prices_yesterday){ [490,489,487,488,475,489,450,490,491,492,493,494,497,500,467,490,504,506,508,497,499,520,534,576,587,599,620,602,604,603,587,596,595,593,591,540] }

  describe '#methodname' do
    it 'does something' do
      expect(get_best_profit(stock_prices_yesterday)).to eq 170
    end
  end
end