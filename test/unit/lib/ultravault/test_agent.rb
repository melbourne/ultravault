require_relative '../../../test_helper'

class AgentTest < Test::Unit::TestCase
  
  context 'a new agent' do
    
    setup do
      @params = { :description=>"test-MSSQL",
                  :hostname=>"46.20.232.228",
                  :id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                  :os_type=>"WINDOWS",
                  :port_number=>"1167"}
    end
    
    context 'attributes' do
      setup do
        @agent = UltraVault::Agent.new(@params)
      end
      
      should "match the input description" do
        assert_equal @params[:description], @agent.description
      end
      
      should "match the input hostname" do
        assert_equal @params[:hostname], @agent.hostname
      end
      
      should "match the input id" do
        assert_equal @params[:id], @agent.id
      end
      
      should "match the input os_type" do
        assert_equal @params[:os_type], @agent.os_type
      end
      
      should "match the input port_number" do
        assert_equal @params[:port_number], @agent.port_number
      end
      
      should "respond to .disk_safes via an api call" do
        UltraVault::DiskSafe.expects(
              :find_all_by_agent_id).with(
              @params[:id]).returns(stub)
        @agent.disk_safes
      end
      
    end
    
    context 'class methods' do
      should "pass on the .find_by_id call to the agent service" do
        UltraVault::AgentService.any_instance.expects(:find_agent_by_id).with('foo')
        UltraVault::Agent.find_by_id('foo')
      end
      
      should "pass on the .all call to the agent service" do
        UltraVault::AgentService.any_instance.expects(:all_agents)
        UltraVault::Agent.all       
      end
      
      should "pass on the .create call to the agent service" do
        params = {  :hostname => 'foobar', :port_number => 8080,
                    :description => 'foobar',
                    :os_type => 'linux'
                 }
        UltraVault::AgentService.any_instance.expects(:create_agent).with(params)
        UltraVault::Agent.create(params)
      end
      
      should "pass on the .update call to the agent service" do
        params = @params.merge({ :hostname => 'bazfoobar' })
        UltraVault::AgentService.any_instance.expects(:update_agent).with(params)
        agent = UltraVault::Agent.new(@params)
        agent.update(params)
      end
      
      should "pass on the .destroy call to the agent service" do
        id = "12345"
        UltraVault::AgentService.any_instance.expects(:destroy_agent).with(id)
        agent = UltraVault::Agent.new(@params.merge!(id: id))
        agent.destroy
      end
    end
  end
end