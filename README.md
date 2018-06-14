## DCDrinks

DCDrinks is a cli application that allows users to select any day of the week to view that day's happy hour specials in DC. Instead of filtering through deep food and drink databases and sifting through dozens of DC drink blogs, allow DCDrinks to find a quick and up-to-date spot for you, even on the go!

Users will be able to select the day of interest and scan the important details of each listing -name, location, happy hour times, happy hour features, and url.

Installation

Add this line to your application's Gemfile:

```ruby
gem 'dcdrinks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dcdrinks

## Usage

The DCDrinks app runs from the executable bin/dcdrinks and once initialized, the cli will generate a list of days -Sunday through Saturday -for the user to select. A day is selected by a numerical value system, ie., 1. Sunday with user inputing "1." After day is selected, a new list will be generated, which is also numbered and can be selected in the same way. This list will showcase happy hours associated to the selected day along with basic details of location, happy hour times, happy hour features, and url, ie., 1. Harold Black - Capitol Hill, NE - 3:30-5pm - $7 cocktails and wine - http://www.haroldblackdc.com.

A user may exit at any time by typing "exit." When the user is within the happy hour listings menu, they can type "previous" to return to the day selection menu.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'CSavi'/dcdrinks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dcdrinks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'CSavi'/dcdrinks/blob/master/CODE_OF_CONDUCT.md).
