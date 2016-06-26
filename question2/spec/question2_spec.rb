require 'spec_helper'
require_relative '../lib/cake_q2'

RSpec.describe 'Product of all ints except at index' do

  let(:array1) { [1,2,6,5,9] }
  let(:array2) { [1,7,3,4] }
  let(:array3) { [0,7,3,4] }
  let(:array4) { [3, 1, 2, 5, 6, 4] }

  describe '#get_products_of_all_ints_except_at_index' do
    it 'find the product of every integer except the integer at that index' do
      expect(get_products_of_all_ints_except_at_index(array1)).to eq [540,270,90,108,60]
    end

    it 'find the product of every integer except the integer at that index' do
      expect(get_products_of_all_ints_except_at_index(array2)).to eq [84,12,28,21]
    end

    it 'find the product of every integer except the integer at that index' do
      expect(get_products_of_all_ints_except_at_index(array3)).to eq [84,0,0,0]
    end

    it 'find the product of every integer except the integer at that index' do
      expect(get_products_of_all_ints_except_at_index(array4)).to eq [240,720,360,144,120,180]
    end
  end
end













