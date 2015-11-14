require 'spec_helper'

class User < ActiveRecord::Base
  include NotFound::Mixin
end

describe User, 'model' do
  describe 'with NotFound::Mixin included' do
    describe 'when record does not exist' do
      it 'raises User::RecordNotFound' do
        expect { User.find(1) }.to raise_error(User::RecordNotFound)
      end

      it 'raises ActiveRecord::RecordNotFound' do
        expect { User.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises User::RecordNotFound with expected message' do
        expect { User.find(1) }.to raise_error(User::RecordNotFound, /Couldn't find User/)
      end
    end
  end
end
