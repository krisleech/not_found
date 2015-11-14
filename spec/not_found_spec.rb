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
        # FIXME: why different on CI
        expected_message = ENV.has_key?('CI') ? "Couldn't find User with id=1" : "Couldn't find User with 'id'=1"
        expect { User.find(1) }.to raise_error(User::RecordNotFound, expected_message)
      end
    end
  end
end
