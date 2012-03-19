require_relative '../test_helper'

stub_request(:post, "http://foo:bar@foo.bar.baz:9080/Agent").
  with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><env:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:wsdl=\"http://agent.api.server.backup.r1soft.com/\" xmlns:env=\"http://schemas.xmlsoap.org/soap/envelope/\"><env:Body><getAgentByID><id>e9bd701b-dac1-4921-ab1c-467f35209e21</id></getAgentByID></env:Body></env:Envelope>",
       :headers => {'Accept'=>'*/*', 'Content-Length'=>'371', 'Content-Type'=>'text/xml;charset=UTF-8', 'Soapaction'=>'"getAgentByID"', 'User-Agent'=>'Ruby'}).
  to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getAgentByIDResponse xmlns:ns1=\"http://agent.api.server.backup.r1soft.com/\"><return><databaseAddOnEnabled>false</databaseAddOnEnabled><description>test-MSSQL</description><hostname>46.20.232.228</hostname><id>e9bd701b-dac1-4921-ab1c-467f35209e21</id><osType>WINDOWS</osType><portNumber>1167</portNumber></return></ns1:getAgentByIDResponse></soap:Body></soap:Envelope>", :headers => {})