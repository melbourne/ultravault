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
      
      should "respond to .disk_safes" do
        assert @agent.respond_to? :disk_safes
      end
      
    end
  end
end