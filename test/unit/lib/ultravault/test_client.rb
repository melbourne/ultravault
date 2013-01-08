require_relative '../../../test_helper'

module UltraVault
  class ClientTest < Test::Unit::TestCase
  
    context "creating a client" do
    
      setup do
        @options = { endpoint: "some.valid.url", namespace: 'foo.bar.baz',
                     username: "foo", password: "bar" }
        @client = Client.new @options
        @savon_client = @client.instance_variable_get("@client")
      end
    
      context '#initialize' do
        should "pass off connection options to savon client" do
          Savon::Client.expects(:new)
          Client.new @options
        end
      
        should "set the endpoint" do
          assert_equal @savon_client.wsdl.endpoint,
            @options[:endpoint]
        end
      
        should "set the namespace" do
          assert_equal @savon_client.wsdl.namespace,
            @options[:namespace]
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
end