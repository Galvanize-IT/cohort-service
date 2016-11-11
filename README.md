CohortService
=============

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cohortservice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cohortservice

## Usage

### Simple

```ruby
CohortService.cohort_info('16-10-DS-DP')
```

You'll get back a hash that includes the following:

```ruby
{
  course: 'Data Science Immersive',
  education: 'Data Science',
  campus: 'Denver - Platte',
  label: '16-10-DS-DP',
  location: {
    value: '1644 Platte St, Denver, CO 80202',
    area: 'Denver, CO',
    lat: 39.757657,
    lng: -105.006953
  }
}
```

### Advanced

```ruby
cohort = CohortService::Cohort.new('16-10-FS-DG')
cohort.info # => Cohort Info Hash
cohort.course # => 'Web Development Immersive'
cohort.education # => 'Web Development'
cohort.campus # => 'Denver - Golden Triangle'
cohort.location # => {value: '1644 Platte St, Denver, CO 80202', area: 'Denver, CO', lat: 39.733513, lng: -104.992588}
cohort.latlng # => {lat: 39.733513, lng: -104.992588}
```


## Development

Standard ruby project using bundler. Run `rake` to run the specs.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cohortservice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

