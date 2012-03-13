# UltraVault

## Intended usage

    require 'ultravault'

    # Connect to ultravault
    @client = UltraVault::Client.new(user_id, password)
    
    # Create a new volume
    volume = UltraVault::Volume.new(@client, name)
    
    # Create an agent
    agent = UltraVault::Agent.new(@client, name, host, port)
    
    # Create a new disk safe
    agent.disksafes << UltraVault::DiskSafe.new(volume)
    
## Connecting with Savon:
    
    ruby-1.9.3-p0 :025 > client = Savon::Client.new('http://melbournesupport:******@sanmarino.melbourne.co.uk:9080/Volume?wsdl')
     => #<Savon::Client:0x007ff4f4800188 @wsdl=#<Savon::Wasabi::Document:0x007ff4f48000e8 @document="http://melbournesupport:******@sanmarino.melbourne.co.uk:9080/Volume?wsdl", @request=#<HTTPI::Request:0x007ff4f4800020>>, @http=#<HTTPI::Request:0x007ff4f4800020>> 
    ruby-1.9.3-p0 :026 > client.request(:getVolumeIDs)
    D, [2012-03-13T16:33:03.991991 #24027] DEBUG -- : HTTPI executes HTTP GET using the net_http adapter
    D, [2012-03-13T16:33:05.214282 #24027] DEBUG -- : SOAP request: http://sanmarino.melbourne.co.uk:9080/Volume
    D, [2012-03-13T16:33:05.214386 #24027] DEBUG -- : SOAPAction: "getVolumeIDs", Content-Type: text/xml;charset=UTF-8, Content-Length: 394
    D, [2012-03-13T16:33:05.214416 #24027] DEBUG -- : <?xml version="1.0" encoding="UTF-8"?><env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:wsdl="http://volume.api.server.backup.r1soft.com/" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ins0="http://volume.api.server.backup.r1soft.com/"><env:Body><ins0:getVolumeIDs></ins0:getVolumeIDs></env:Body></env:Envelope>
    D, [2012-03-13T16:33:05.214460 #24027] DEBUG -- : HTTPI executes HTTP POST using the net_http adapter
    D, [2012-03-13T16:33:05.738207 #24027] DEBUG -- : SOAP response (status 200):
    D, [2012-03-13T16:33:05.738281 #24027] DEBUG -- : <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><ns1:getVolumeIDsResponse xmlns:ns1="http://volume.api.server.backup.r1soft.com/"><return>2bb5d10d-ed25-48b1-8eaa-1e0df2e129b4</return></ns1:getVolumeIDsResponse></soap:Body></soap:Envelope>
     => #<Savon::SOAP::Response:0x007ff4f4c73530 @http=#<HTTPI::Response:0x007ff4f4c74480 @code=200, @headers={"server"=>"Apache-Coyote/1.1", "content-type"=>"text/xml;charset=UTF-8", "content-length"=>"271", "date"=>"Tue, 13 Mar 2012 16:33:05 GMT"}, @raw_body="<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getVolumeIDsResponse xmlns:ns1=\"http://volume.api.server.backup.r1soft.com/\"><return>2bb5d10d-ed25-48b1-8eaa-1e0df2e129b4</return></ns1:getVolumeIDsResponse></soap:Body></soap:Envelope>", @body="<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getVolumeIDsResponse xmlns:ns1=\"http://volume.api.server.backup.r1soft.com/\"><return>2bb5d10d-ed25-48b1-8eaa-1e0df2e129b4</return></ns1:getVolumeIDsResponse></soap:Body></soap:Envelope>">, @soap_fault=Savon::SOAP::Fault, @http_error=Savon::HTTP::Error> 
    ruby-1.9.3-p0 :027 >


## Rails

Add this to your Gemfile:

  gem 'ultravault'

Run

  bundle install
