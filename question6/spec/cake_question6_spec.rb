require 'spec_helper'
require_relative '../lib/cake_question6.rb'

RSpec.describe 'Interview Cake Question 6: OkEros Love Rectangle' do

  let(:rect1) { { x: 1, y: 5, w: 10, h: 4 } }
  let(:rect2) { { x: 8, y: 3, w: 4, h: 8 } }
  let(:rect3) { { x: 0, y: 2, w: 4, h: 6 } }
  let(:rect4) { { x: 6, y: 0, w: 8, h: 4 } }

  describe 'love_rectangle' do
    it 'finds the intersection of two triangles in x,y/w,h coordinates' do
      expect(love_rectangle(rect1, rect2)).to eq({ x: 8, y: 5, w: 3, h: 4 })
    end

    it 'does something reasonable if there is no intersection' do
      expect(love_rectangle(rect3,rect4)).to eq({ x: nil, y: nil, w: nil, h: nil})
    end
  end
end
