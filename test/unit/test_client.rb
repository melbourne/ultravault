require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../lib/ultravault/base'

class ClientTest < Test::Unit::TestCase
  
  context "main" do
    
    setup do
      @options = { url: "some.valid.url", username: "foo", password: "bar" }
      @mock_client = mock
      @mock_client.expects(:connect).with(@options[:username], @options[:password])
      Savon::Client.expects(:new).with("some.valid.url").returns(@mock_client)
    end
    
    context '#initialize' do
      should "pass off url to savon client instance" do
        UltraVault::Base.new @options
      end
    end
    
    context "#client" do
      should "respond to client" do
        UltraVault::Base.new(@options).respond_to? :client
      end
    end
    
  end
  
end