# NotFound

Allows you to rescue `ActiveRecord::RecordNotFound` for a specific model.

For example if you have a `User` model you can rescue `User::RecordNotFound`.

Code which rescue `ActiveRecord::Record` will still work as expected.

## Why?

Because a rescue block around code which rescues `ActiveRecord::RecordNotFound`
might work as expected today, but some time in the future when within that
block another model ends up raising `ActiveRecord::RecordNotFound` it leads to
unexpected, or at the very least, behaviour.

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

and rescue away

```ruby
begin
  user = User.find(id)
rescue User::RecordNotFound
  # handle
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/not_found. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

