require 'spec_helper'

class User < ActiveRecord::Base
end

describe NotFound::Mixin do
  describe 'when record does not exist' do
    it 'raises RecordNotFound scoped to model' do
      expect { User.find(1) }.to raise_error(User::RecordNotFound)
    end

    it 'raise ActiveRecord::RecordNotFound' do
      expect { User.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  it 'has a version number' do
    expect(NotFound::VERSION).not_to be nil
  end
end
