require_relative '../test_helper'
require_relative '../../lib/ultravault'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "#{File.dirname(__FILE__)}/../vcr_cassettes"
  c.hook_into :webmock # or :fakeweb
end

class ClientCodeTest < Test::Unit::TestCase

  context "typical usage" do            
    
    should "retrieve agents, disksafes and recovery points" do
      VCR.use_cassette('all_agents') do
              
        # Set up the service
        UltraVault.configure do |config|
          config.host = 'foo.bar.baz'
          config.port = 9080
          config.api_version = 1
          config.ssl = false
          config.username = 'foo'
          config.password = 'bar'
          config.debug = false
        end
         
        # Get all agents
        agents = UltraVault::Agent.all
        assert agents.count > 0

        # Check disksafes
        agent = agents.first
        assert agent.disk_safes.count > 0
                                        
        # Check recovery points
        disk_safe = agent.disk_safes.first
        assert disk_safe.recovery_points.count > 0
      end   
      
      VCR.use_cassette('agent_by_id') do
        # Get an agent
        agent = UltraVault::Agent.find_by_id("157b9915-0ec8-45cd-a04f-aeea13f48c8e")
        assert_not_nil agent
      end
    end
    
    should "create, modify and delete agents" do
      VCR.use_cassette('create_mod_rm_agents') do
              
        # Set up the service
        # UltraVault.configure do |config|
        #   config.host = 'foo.bar.baz'
        #   config.port = 9080
        #   config.api_version = 1
        #   config.ssl = false
        #   config.username = 'foo'
        #   config.password = 'bar'
        #   config.debug = false
        # end
        
        UltraVault::configure do |c|
          c.host = "nectar.melbourne.co.uk"
          c.port = 9080
          c.username = "melbournesupport"
          c.password = '5G&?v2rV'
        end
         
        # Create new agent
        agent = UltraVault::Agent.create(
                :hostname => 'foobar.com', :port_number => 9080,
                :description => 'foobarbazbar',
                :os_type => 'linux'
        )
        
        assert_not_nil agent
        
        agent_id = agent.id
        agent_old_host = agent.hostname
        
        # Update an agent's properties
        agent.update(:host => 'bazbar')
        assert_not_equal agent_hold_host, agent.host
        
        # Delete an agent
        agent.destroy
        assert_nil agent
        
        agent = UltraVault::Agent.find_by_id(agent_id)
        assert_nil agent
      end   
      
      VCR.use_cassette('agent_by_id') do
        # Get an agent
        agent = UltraVault::Agent.find_by_id("157b9915-0ec8-45cd-a04f-aeea13f48c8e")
        assert_not_nil agent
      end
    end
  end
end