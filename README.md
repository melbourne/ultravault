# UltraVault

## Intended usage

    require 'ultravault'

    # Connect to ultravault
    @client = UltraVault::Client.new(user_id, password)
    
    # Create a new volume
    volume = UltraVault::Volume.new(@client, name)
    
    # Create an agent
    agent = UltraVault::Agent.new(@client, name, host, port)
    
    # Create a new disk safe
    agent.disksafes << UltraVault::DiskSafe.new(volume)


## Rails

Add this to your Gemfile:

  gem 'ultravault'

Run

  bundle install
