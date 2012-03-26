require_relative '../../../test_helper'

module UltraVault
  class ConfigTest < Test::Unit::TestCase
    context "overriding config" do

      setup do
        UltraVault.configure do |config|
          config.host = 'baz.bar.foo'
          config.port = 5000
          config.api_version = 4
          config.ssl = true
          config.username = 'bar'
          config.password = 'foo'        
        end
      end
    
      should "be configurable" do
        assert_equal UltraVault.config.host, "baz.bar.foo"
        assert_equal UltraVault.config.port, 5000
        assert_equal UltraVault.config.api_version, 4
        assert_equal UltraVault.config.ssl, true
        assert_equal UltraVault.config.username, "bar"
        assert_equal UltraVault.config.password, "foo"
      end
    
      should "be configurable via hash" do
        assert_equal UltraVault.config.host, 'baz.bar.foo'
        UltraVault.config = { :host => 'baz' }
        assert_equal UltraVault.config.host, 'baz'
        # Make sure defaults not reverted
        assert_equal UltraVault.config.api_version, 4
      end
    end
  
  end
end