# Quotefm

Wrapper around the quote.fm REST API with access to all currently available functions.

## Installation

Add this line to your application's Gemfile:

    gem 'quotefm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quotefm

## Usage

The Wrapper is split up into one class for every part of the API:

* Quotefm::Article
* Quotefm::Category
* Quotefm::Page
* Quotefm::Recommendation
* Quotefm::User

Every class wraps all available API calls for the appropriate datatype.
Returned results are plain JSON and can be accessed like a Hash in Ruby.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
