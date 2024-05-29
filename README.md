# ChargifyWrapper

## Requirements

Ruby 3.1.3

## Usage

```ruby
ChargifyWrapper.configure do |config|
  config.subdomain = 'your-local-subdomain'
  config.api_key = 'your-local-api-key'
  config.log_requests = true # default is false
end
```
After setting up those values, you can perform actions using the `Chargify::Wrapper` module as prefix.

## Development

Run bundle install
```
bundle install
```
### Use gem locally

1. Uninstall previous versions
```
gem uninstall --force chargify_wrapper
```

2. Build gem from gemspec
```
gem build chargify_wrapper.gemspec --ouput=chargify_wrapper.gem
```

3. Install gem locally
```
gem install chargify_wrapper --local chargify_wrapper.gem
```

You can now use the gem as any other inside a ruby script or `irb`.

> [!NOTE]
> When developing new features, some classes might not be regonized even after
> rebuilding the gem, specially in the case where a new class is created.
> To fix that, add the new class to git using `git add PATH_TO_NEW_CLASS.rb` and
> rebuild the gem.

## Running specs

```
rake spec
```
