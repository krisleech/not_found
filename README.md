# NotFound (alpha)

[![Gem Version](https://badge.fury.io/rb/not_found.png)](http://badge.fury.io/rb/not_found)
[![Code Climate](https://codeclimate.com/github/krisleech/not_found.png)](https://codeclimate.com/github/krisleech/not_found)
[![Build Status](https://travis-ci.org/krisleech/not_found.png?branch=master)](https://travis-ci.org/krisleech/not_found)
[![Coverage Status](https://coveralls.io/repos/krisleech/not_found/badge.png?branch=master)](https://coveralls.io/r/krisleech/not_found?branch=master)

Allows you to rescue `ActiveRecord::RecordNotFound` for a specific model.

For example if you have a `User` model you can rescue `User::RecordNotFound`.

Code which rescue `ActiveRecord::Record` will still work as expected.

## Why?

Because a rescue block around code which rescues `ActiveRecord::RecordNotFound`
might work as expected today, but some time in the future when within that
block another model ends up raising `ActiveRecord::RecordNotFound` it leads to
unexpected behaviour which is diffcult to trace. This gem allows you to be
explicit about what you want to rescue.

## Installation

```ruby
gem 'not_found'
```

## Usage

Include the mixin for a single model

```ruby
class User < ActiveRecord::Base
  include NotFound::Mixin
end
```

or every model

```ruby
ActiveRecord::Base.class_eval { include NotFound::Mixin }
```

and rescue away like this

```ruby
begin
  user = User.find(id)
rescue User::RecordNotFound
  # handle missing user
end
```

or this

```ruby
begin
  user = User.find(id)
  post = Post.find(id)
rescue User::RecordNotFound
  # handle missing user
rescue Post::RecordNotFound
  # handle missing post
end
```

or this

```ruby
begin
  user = User.find(id)
  post = Post.find(id)
rescue User::RecordNotFound
  # handle missing user
rescue ActiveRecord::RecordNotFound
  # handle missing posts and other models
end
```

## Compatibility

Tested with MRI 2.x, JRuby and Rubinius.

See the [build status](https://travis-ci.org/krisleech/not_found) for details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Running Specs

```
bundle exec rspec
```

To run the specs on code changes try [entr](http://entrproject.org/):

```
ls **/*.rb | entr bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krisleech/not_found. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

