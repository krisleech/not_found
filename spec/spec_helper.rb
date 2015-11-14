$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pry' unless ENV.has_key?('CI')
require 'not_found'

puts "Using ActiveRecord #{ActiveRecord::VERSION::STRING}"

adapter = RUBY_PLATFORM == "java" ? 'jdbcsqlite3' : 'sqlite3'

ActiveRecord::Base.establish_connection(:adapter => adapter,
                                        :database => File.dirname(__FILE__) + "/db.sqlite3")

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string  :name
    t.string :email
    t.timestamps null: true
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
