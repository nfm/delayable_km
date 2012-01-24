# delayable_km

`delayable_km` is a minimal implementation of the [KISSmetrics](http://www.kissmetrics.com/) API that can be used with `delayed_job`.

The [official KISSmetrics gem](https://github.com/kissmetrics/km) is written is incompatible with `delayed_job`. They instead use a [cron based](http://support.kissmetrics.com/apis/cron) method to asynchronously send data to KISSmetrics.

I'd prefer to use `delayed_job`, hence the gem.

## Installation

Add this line to your application's Gemfile:

    gem 'delayable_km'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delayable_km

## Usage

This gem is used in a similar way to the [official gem](https://github.com/kissmetrics/km), but it requires that you instantiate an API client:

    # Official km gem approach:
    KM.initialize(your_api_key)
    KM.identify(current_user.email)
    KM.record('some event')

    # delayable_km approach:
    @km ||= KM.initialize(your_api_key)
    @km.identify(current_user.email)
    @km.record(event, optional_properties)

As a result, it can be used with `delayed_job`:

    # Will be added to your queue of jobs for delayed_job to run
    @km.delay.record(event, optional_properties)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
