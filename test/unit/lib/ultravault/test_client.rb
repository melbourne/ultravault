require_relative '../../../test_helper'
require_relative '../../../../lib/ultravault/client'

class ClientTest < Test::Unit::TestCase
  
  context "creating a client" do
    
    setup do
      @options = { endpoint: "some.valid.url", namespace: 'foo.bar.baz', username: "foo", password: "bar" }
      @client = UltraVault::Client.new @options
      @savon_client = @client.instance_variable_get("@client")
    end
    
    context '#initialize' do
      should "pass off connection options to savon client" do
        Savon::Client.expects(:new)
        UltraVault::Client.new @options
      end
      
      should "set the endpoint" do
        assert @savon_client.wsdl.endpoint.length > 0,
          "endpoint not set"
      end
      
      should "set the namespace" do
        assert @savon_client.wsdl.namespace.length > 0,
          "namespace not set"
      end
      
      should "set the credentials" do
        assert_equal @savon_client.http.auth.basic,
        [@options[:username], @options[:password]]
      end
    end
    
    context "#request" do
      should "pass action and args to the savon client" do
        action, args = "foo", ["bar", "baz"]
        @savon_client.expects(:request).with(action, :body => args)
        @client.request(action, args)
      end
    end
    
  end
  
end