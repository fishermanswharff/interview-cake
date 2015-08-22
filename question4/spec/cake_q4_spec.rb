require 'spec_helper'
require 'rinda/tuplespace'
require_relative '../lib/cake_q4.rb'

RSpec.describe 'Interview Cake Question 4' do
  let(:meeting_times_1) { [[1,3], [3,5]] }
  let(:meeting_times_2) { [[1,10],[2,6],[4,5], [7,9]] }
  let(:meeting_times_3) { [[3,5],[4,8],[10,12],[9,10],[0,1]] }

  it 'condenses the meeting times if the times are touching' do
    expect(condense_meetings(meeting_times_1)).to eq [[1,5]]
  end

  it 'condenses the meeting from earliest start time to latest stop time' do
    expect(condense_meetings(meeting_times_2)).to eq [[1,10]]
  end

  it 'condenses the meeting times even when meeting times are not in order' do
    expect(condense_meetings(meeting_times_3)).to eq [[0, 1], [3, 8], [9, 12]]
  end
end