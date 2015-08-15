require 'spec_helper'
require_relative '../lib/cake_q3'

RSpec.describe 'Product of 3 Ints' do

  let(:array1){ [2,1,4,3,7,34,12,87,45,39,6,5,23] }
  let(:array2){ [1,2,3,4,5,6,7,8,9,10,11,12,13,14] }
  let(:array3){ [2,3,4,5] }
  let(:array4){ [-10,-10,1,3,2] }

  describe '#product_of_ints' do
    it('returns the highest product you can get from any 3 integers in the array') do
      expect(highest_product_from_three_ints(array1)).to eq 152685
      expect(highest_product_from_three_ints(array2)).to eq 2184
      expect(highest_product_from_three_ints(array3)).to eq 60
      expect(highest_product_from_three_ints(array4)).to eq 300
    end
  end
end