require 'spec_helper'
require 'rinda/tuplespace'
require_relative '../lib/cake_q4.rb'

RSpec.describe 'Interview Cake Question 4' do
  let(:meeting_times_1) { [[1,3], [3,5]] }
  let(:meeting_times_2) { [[1,10],[2,6],[3,5], [7,9]] }
  let(:meeting_times_3) { [[0,1],[3,5],[4,8],[10,12],[9,10]] }

  it 'condenses the meeting times' do
    expect(condense_meetings(meeting_times_1)).to eq [[1,5]]
    expect(condense_meetings(meeting_times_2)).to eq [[1,10]]
    expect(condense_meetings(meeting_times_3)).to eq [[0, 1], [3, 8], [9, 12]]
  end
end