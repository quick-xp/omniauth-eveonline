# Omniauth::Eveonline

Eve Online OAuth2 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-eveonline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-eveonline

## Usage

`OmniAuth::Strategies::EveOnline` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's an example for adding the middleware to a Rails app in config/initializers/omniauth.rb:
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :eveonline, ENV['CLIENT_ID'], ENV['SECRET_KEY']
end
```

You can now access the OmniAuth Eve Online OAuth2 URL: /auth/eve_online

## Configuration

You can configure one option, which you pass in to the provider method via a hash:
Option name | Explanation
--- | ---
`scope` | you can set <blank> or 'publicData'

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

{
  :provider => 'eve_online',
  :uid => '1234567',
  :info => {
    :character_id => '1234567',
    :character_name => 'EVE TARO',
    :expires_on => '2014-12-31T11:46:06.441086Z',
    :token_type => 'Character'
  },
  :credentials => {
    :token => 'ABCDEF...',
    :refresh_token => 'ABCDEF...'
    :expires_at => 1321747205,
    :expires => true
  }
 }


## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-eveonline/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
