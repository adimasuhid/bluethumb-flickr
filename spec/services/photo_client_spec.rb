require 'rails_helper'

RSpec.describe PhotoClient do
  let(:dummy_result) { double(url: "test-url") }
  let(:dummy_client) { double(search: [dummy_result, dummy_result, dummy_result]) }

  subject { PhotoClient.new(dummy_client) }

  describe '#search' do
    it 'returns photo objects' do
      results = subject.search("dog")

      expect(results).to_not be_empty
      expect(results.sample).to respond_to :url
    end

    it 'calls search to client' do
      expect(dummy_client)
        .to receive(:search)
        .with(hash_including(text: "dog"))

      subject.search("dog")
    end

    context 'given params' do
      it 'can limit the number of results' do
        expect(dummy_client)
          .to receive(:search)
          .with(hash_including(per_page: 1))

        subject.search("dog", per_page: 1)
      end

      it 'can select the page number of results' do
        expect(dummy_client)
          .to receive(:search)
          .with(hash_including(page: 1))

        subject.search("dog", page: 1)
      end
    end
  end

  describe '#last_request_success?' do
    it 'returns true when last request is successful' do
      subject.search("dog")
      expect(subject.last_request_success?).to eq true
    end

    it 'returns false when last request has failed' do
      allow(dummy_client).to receive(:search).and_raise(SocketError)
      expect(subject.search("dog")).to eq []
      expect(subject.last_request_success?).to eq false
    end
  end
end
