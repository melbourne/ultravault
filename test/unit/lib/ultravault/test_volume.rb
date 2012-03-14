require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../../../lib/ultravault/client'
require_relative '../../../../lib/ultravault/volume'

class VolumeTest < Test::Unit::TestCase
  context 'creating a volume' do
    setup do
      @client = mock
      @client.expects(:get)
      @volume = UltraVault::Volume.new(@client, 'foo')
    end
    
  end
end