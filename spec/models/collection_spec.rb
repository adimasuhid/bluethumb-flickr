require 'rails_helper'

RSpec.describe Collection do
  it 'acts like an array' do
    expect(subject).to respond_to :count
    expect(subject).to respond_to :each
  end

  describe '#total' do
    let(:collection) { Collection.new([1,2,3,4]) }

    it 'returns current length' do
      expect(collection.total).to eq 4
    end
  end
end
