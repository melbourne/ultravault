# UltraVault

## Intended usage

    require 'ultravault'

    # Connect to ultravault
    @client = UltraVault::Client.new(user_id, password, uri)
    
    # Getting ultravault data
    
    # Retrieve agents for user
    agent_service = UltraVault::AgentService.new(@client)
    agents = agentservice.all # Array of Agent objects
    
    UltraVault::Agent has many UltraVault::DiskSafes
    Disksafes retrieved on Agent initialization
    
    agents.each do |agent|
      disksafes = agent.disksafes
    end
    
    # Retrieve disksafes for a user service
    
    disksafe_service = UltraVault::DisksafeService.new(user_id, password, host, api_version, agent)
    disksafes = disksafe_sevice.all
    
    # Create a new volume
    volume = UltraVault::Volume.new(@client, name)
    
    # Create an agent
    agent = UltraVault::Agent.new(@client, name, host, port)
    
    # Create a new disk safe
    agent.disksafes << UltraVault::DiskSafe.new(volume)
    
## Connecting with Savon:


Getting Savon to be our bitch

    # Get a disksafe
    
    client = Savon::Client.new('http://nectar.melbourne.co.uk:9080/DiskSafe?wsdl')
    client.http.auth.basic 'melbournesupport', '******'

    response = client.request :getDiskSafeByID do |soap|
      soap.body do |xml|
        xml.id '3067f030-9814-4314-ae03-75933ac29e37'
      end
    end
    
    # Disksafe ID:
    id = { :id => response.to_hash[:get_disk_safe_by_id_response][:return][:id] }

    # Get recovery points for disksafe
    
    client = Savon::Client.new do
      wsdl.endpoint = "http://nectar.melbourne.co.uk:9080/RecoveryPoints"
      wsdl.namespace = "http://recoverypoints.api.server.backup.r1soft.com/"
      http.auth.basic 'melbournesupport', '******'
    end

    client.request :getRecoveryPoints, :body => { :diskSafe => id, :includeMerged => false }

Converting recovery point time (ms) to Ruby time

    t = Time.at(1330427016495/1000.0)
    t.strftime("%Y-%m-%d %H:%M.%S")


## Rails

Add this to your Gemfile:

  gem 'ultravault'

Run

  bundle install
