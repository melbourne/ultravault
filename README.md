# UltraVault

A simple wrapper gem for the UltraVault API allowing users to retrieve information about their agents, disk safes and recovery points.

## Installing with Bundler

Add this to your Gemfile:

```ruby
gem 'ultravault', :git => "git@github.com:melbourne/ultravault.git", :branch => :master
```

Run

    $ bundle install

## Intended usage

See test/integration/client_code.rb for an executable example.

### Inclusion

```ruby   
require 'ultravault'
```            

### Configure

```ruby   
UltraVault.configure do |config|
   config.host = 'foo.bar.baz'
   config.port = 9080
   config.api_version = 1
   config.ssl = false
   config.username = 'foo'
   config.password = 'bar'
   config.debug = false
end   
```

or

```ruby   
UltraVault.config = { host: 'baz.bar.foo' }
```
 
### Retrieving data

```ruby   
# Retrieving an agent
agent = UltraVault::Agent.find_by_id("e9bd701b-dac1-4921-ab1c-467f35209e21")

# Retrieve all agents
agents = UltraVault::Agent.all

# Retrieving a disk safe
disk_safe = agent.disk_safes.first

# Retrieving recovery points
recovery_point = disk_safe.recovery_points.first  
```

## Authoring changes

### Testing

Make sure you run the test suite in full before pushing changes. Write new tests as you add new features.

    $ rake unit        # run unit tests
    $ rake integration # run integration tests

