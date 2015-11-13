require "not_found/version"
require 'active_record'

module NotFound
  module Mixin
    def self.included(base)
      base.class_eval do
        include ActiveSupport::Rescuable

        base.const_set('RecordNotFound', ActiveRecord::RecordNotFound)

        rescue_from ActiveRecord::RecordNotFound do |e|
          raise User::RecordNotFound
        end
      end
    end
  end
end
