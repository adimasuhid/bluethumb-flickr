require 'rails_helper'

RSpec.describe Pagination do
  describe '.create' do
    let(:collection) { Collection.new([double(:result)]) }

    it 'creates a collection' do
      results = Pagination.create(
        results: collection
      )
      expect(results.count).to eq 1
    end
  end
end
