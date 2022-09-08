# sowprog-api-ruby

## API keys

API keys must be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
Ravelry.configure do |config|
  config.username = ''
  config.password = ''
end
```

- `config.username` - your username account
- `config.password` - your password account

Getting these keys requires a (free) Sowprog account and that you agree to the terms of use for the API.

The keys are available to you throughout your application as:

```ruby
Ravelry.configuration.username
Ravelry.configuration.password
```
[Source](https://github.com/feministy/lizabinante.com/blob/stable/source/2016-01-30-creating-a-configurable-ruby-gem.markdown)