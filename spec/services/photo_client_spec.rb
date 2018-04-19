require 'rails_helper'

RSpec.describe PhotoClient do
  describe '.search' do
    it 'returns photo objects'

    context 'given a limit' do
      it 'can limit the number of results'
    end

    context 'given a page number' do
      it 'can select the page number of results'
    end
  end

  describe '.native_url' do
    it 'returns a direct to image url of the photo object'
  end
end
