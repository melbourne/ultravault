require_relative '../../../../../test_helper'

module UltraVault::V1
  class AgentTest < Test::Unit::TestCase
  
    context 'a new agent' do
    
      setup do
        @params = { :description=>"test-MSSQL",
                    :hostname=>"1.2.3.4",
                    :id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                    :os_type=>"WINDOWS",
                    :port_number=>"1167"}
      end
    
      context 'attributes' do
        setup do
          @agent = Agent.new(@params)
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
          DiskSafe.expects(
                :find_all_by_agent_id).with(
                @params[:id]).returns(stub)
          @agent.disk_safes
        end

      end
    
      context 'class methods' do
        should "pass on the .find_by_id call to the agent service" do
          AgentService.any_instance.expects(:find_agent_by_id).with('foo')
          Agent.find_by_id('foo')
        end
      
        should "pass on the .all call to the agent service" do
          AgentService.any_instance.expects(:all_agents)
          Agent.all       
        end
      
        should "pass on the .create call to the agent service" do
          params = {  :hostname => 'foobar', :port_number => 8080,
                      :description => 'foobar',
                      :os_type => 'linux'
                   }
          AgentService.any_instance.expects(:create_agent).with(params)
          Agent.expects(:check_params_strict).returns(true)
          Agent.create(params)
        end
      
        should "pass on the .update call to the agent service" do
          params = @params.merge({ :hostname => 'bazfoobar' })
          AgentService.any_instance.expects(:update_agent).with(params)
          Agent.expects(:check_params).returns(true)
          agent = Agent.new(@params)
          agent.update(params)
        end
      
        should "pass on the .destroy call to the agent service" do
          id = "12345"
          AgentService.any_instance.expects(:destroy_agent).with(id)
          agent = Agent.new(@params.merge!(id: id))
          agent.destroy
        end
      end
      
      context "params checking" do
      
        setup do
          @complete_legal_params =     {
                                         :hostname => 'foo', :port_number => 40,
                                         :description => "Bar", :os_type => "Baz"
                                       }
          @incomplete_legal_params =   {
                                         :port_number => 40,
                                         :description => "Bar"
                                       }
          @incomplete_illegal_params = {
                                         :rargh => 'foo', :port_number => 40,
                                         :description => "Bar", :os_type => "Baz"
                                       }
        end
      
        context '#check_params' do
          should "return true if params are legal" do
            assert_equal Agent.check_params(@complete_legal_params), true
          end
        
          should "raise ArgumentError if params are non-legal" do
            assert_raise ArgumentError do
              Agent.check_params(@incomplete_illegal_params)
            end
          end
        end
      
        context '#check_params_strict' do
          should "return true if params are legal and all present" do
            assert_equal Agent.check_params_strict(@complete_legal_params), true
          end
        
          should "raise ArgumentError if params are non-legal/all present" do
            assert_raise ArgumentError do
              Agent.check_params_strict(@incomplete_illegal_params)
            end
            assert_raise ArgumentError do
              Agent.check_params_strict(@incomplete_legal_params)
            end          
          end
        end
      end
    end
  end
end
