require 'spec_helper'
require_relative '../lib/cake_question.rb'
require 'pry-byebug'

RSpec.describe 'Interview Cake Question 21' do

  let(:delivery_id_confirmations) { [] }
  let(:uuid) { SecureRandom.uuid }
  before :each do
    50.times do
      uuid = SecureRandom.uuid
      delivery_id_confirmations.push(uuid)
      delivery_id_confirmations.push(uuid)
    end

    delivery_id_confirmations.push(uuid)
  end

  describe 'Given the array of IDs, which contains many duplicate integers and one unique integer, find the unique integer.' do
    it 'returns the unique id' do
      id = find_unique_id(delivery_id_confirmations)
      expect(id).to eq uuid
    end
  end
end
