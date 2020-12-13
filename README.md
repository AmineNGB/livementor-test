# Jsontocsv

A way to convert a json file in a csv.
It is a Ruby lib aiming to convert JSON files composed of arrays of objects (all following the same schema) to a CSV file where one line equals one object.

Edge cases are not treated, you have to put a valid Json.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsontocsv'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jsontocsv

## Usage

Launch:
    ruby lib/jsontocsv.rb
    --> exemple = JsonToConvert.new('your URL contains your Json')
    --> exemple.convert_json_to_csv
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jsontocsv.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
