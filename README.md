# Turnip::DryRun
[![Build Status](https://travis-ci.org/yasslab/turnip-dry_run.svg?branch=master)](https://travis-ci.org/yasslab/turnip-dry_run)

Do dry run for turnip feature specs to get some step metadata.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'turnip-dry_run'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install turnip-dry_run

## Usage

`spec/support/turnip-dry_run.rb`

```rb
if ENV['DRY_RUN']
  require 'turnip/dry_run'

  Turnip::RSpec::Execute.prepend(Turnip::DryRun)

  RSpec.configure do |config|
    config.formatter = Turnip::DryRun::TextFormatter
  end
end
```

then

```
$ DRY_RUN=t bundle exec rspec
/Users/sei/src/github.com/hanachin/turnip-dry_run/examples/hello.feature:3 there is a monster called "Kijimun" -> /Users/sei/src/github.com/hanachin/turnip-dry_run/examples/steps/monster_steps.rb:1 there is a monster called :name
/Users/sei/src/github.com/hanachin/turnip-dry_run/examples/hello.feature:6 I change its name to "Kijimuna"     -> /Users/sei/src/github.com/hanachin/turnip-dry_run/examples/steps/monster_steps.rb:5 I change its name to :name
/Users/sei/src/github.com/hanachin/turnip-dry_run/examples/hello.feature:7 it should be called "Kijimuna"      -> /Users/sei/src/github.com/hanachin/turnip-dry_run/examples/steps/monster_steps.rb:9 it should be called "Kijimuna"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/hanachin/turnip-dry_run/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

Copyright &copy; 2015 Seiei Miyagi

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
