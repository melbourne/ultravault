require_relative '../../../test_helper'

module UltraVault
  class ApiRequestTest < Test::Unit::TestCase
  
    context "A new api request" do
    
      setup do
        @params = { host: 'foo.bar.baz', port: 9080, service: 'Foo',
          api_version: 1, ssl: false}
      end
    
      context "attributes" do
      
        setup do
          @api_request = ApiRequest.new(@params)
        end
      
        should "return an endpoint" do
          assert_equal "http://#{@params[:host]}:#{@params[:port]}/#{@params[:service]}", @api_request.endpoint
        end
      
        should "use the correct protocol for the endpoint" do
          @api_request = ApiRequest.new(@params.merge(ssl: true))
          assert_equal "https://#{@params[:host]}:#{@params[:port]}/#{@params[:service]}", @api_request.endpoint
        end
      
        should "return a namespace" do
          assert_equal "http://#{@params[:service].downcase}.api.server.backup.r1soft.com/", @api_request.namespace
        end
      
      end
    
    end
  end
end
