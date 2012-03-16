require_relative '../../../test_helper'
require_relative '../../../../lib/ultravault/client'

class ClientTest < Test::Unit::TestCase
  
  context "creating a client" do
    
    setup do
      @options = { endpoint: "some.valid.url", namespace: 'foo.bar.baz', username: "foo", password: "bar" }
    end
    
    context '#initialize' do
      should "pass off connection options to savon client" do
        Savon::Client.expects(:new)
        client = UltraVault::Client.new @options
      end
    end
    
  end
  
end