require 'rails_helper'

RSpec.describe LayoutHelper do
  describe '#flash_class' do
    it 'returns alert-info given :notice' do
      expect(helper.flash_class(:notice)).to eq 'alert alert-info'
    end

    it 'returns alert-success given :success' do
      expect(helper.flash_class(:success)).to eq 'alert alert-success'
    end

    it 'returns alert-error given :error' do
      expect(helper.flash_class(:error)).to eq 'alert alert-danger'
    end

    it 'returns alert-error given :alert' do
      expect(helper.flash_class(:alert)).to eq 'alert alert-danger'
    end

    it 'returns nil when message has no corresponding class' do
      expect(helper.flash_class(:hello)).to eq nil
    end
  end
end
