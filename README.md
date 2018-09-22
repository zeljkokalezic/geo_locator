# GeoDistance

This gem is used to provide a list of customer records that are within desired distance from specified location.
Customer records are a text file -- one customer per line, JSON lines formatted.
This gem will read the full list of customers and output the names and user ids of matching customers (within X meters), sorted by User ID (ascending).

## Installation

This gem is a CLI tool.

Install it yourself as:

    $ gem install geo_distance

## Usage

    $ geo_distance get_customers_in_radius valid_customers.txt 53.339428 -6.257664 100000
    ["Ian Kehoe", 4]
    ["Nora Dempsey", 5]
    ["Theresa Enright", 6]
    ["Eoin Ahearn", 8]
    ["Richard Finnegan", 11]
    ["Christina McArdle", 12]
    ["Olive Ahearn", 13]
    ["Michael Ahearn", 15]
    ["Patricia Cahill", 17]
    ["Eoin Gallagher", 23]
    ["Rose Enright", 24]
    ["Stephen McArdle", 26]
    ["Oliver Ahearn", 29]
    ["Nick Enright", 30]
    ["Alan Behan", 31]
    ["Lisa Ahearn", 39]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zeljkokalezic/geo_distance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GeoDistance project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/geo_distance/blob/master/CODE_OF_CONDUCT.md).
