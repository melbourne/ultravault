# UltraVault

## Rails

Add this to your Gemfile:

    gem 'ultravault'

Run

    bundle install

## Intended usage

    require 'ultravault'

### Configure

``` ruby
UltraVault.configure do |config|
   config.host = 'foo.bar.baz'
   config.port = 9080
   config.api_version = 1
   config.ssl = false
   config.username = 'foo'
   config.password = 'bar'
 end   
```
     
### Create an agent

``` ruby
agent_service = UltraVault::AgentService.new
agent_service.find_agent_by_id("e9bd701b-dac1-4921-ab1c-467f35209e21") # => UltraVault::Agent
```

## Testing

    $ rake unit        # run unit tests
    $ rake integration # run integration tests
