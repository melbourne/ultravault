require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../../../lib/ultravault/client'

class ClientTest < Test::Unit::TestCase
  
  context "creating a client" do
    
    setup do
      @options = { url: "some.valid.url", username: "foo", password: "bar" }
      @mock_client = mock
    end
    
    context '#initialize' do
      should "pass off url to savon client instance and call connect" do
        @mock_client.expects(:connect).with(@options[:username], @options[:password])
        Savon::Client.expects(:new).with(@options[:url]).returns(@mock_client)
        UltraVault::Client.new @options
      end
    end
    
  end
  
end