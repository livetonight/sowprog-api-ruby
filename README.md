# sowprog-api-ruby

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![Gem Version](https://badge.fury.io/rb/sowprog-api-ruby.svg)](https://badge.fury.io/rb/sowprog-api-ruby)

Wrapper for [Sowprog](https://www.sowprog.com/) 🎶 API.

## API keys

API keys must be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
SowprogApiRuby.configure do |config|
  config.user_name = ''
  config.password = ''
end
```

* `config.user_name` - your Sowprog user name
* `config.password` - your Sowprog password

Getting these keys requires a (free) SowprogApiRuby account and that you agree to the terms of use for the API.

The keys are available to you throughout your application as:

```ruby
SowprogApiRuby.configuration.user_name
SowprogApiRuby.configuration.password
```
## Author

![LiveTonight](https://res.cloudinary.com/dcyafbpoh/image/upload/w_200/v1602761423/logo_vert_noir_plat.png)

## License

MIT
