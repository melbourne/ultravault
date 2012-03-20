require_relative '../test_helper'

stub_request(:post, "http://foo:bar@foo.bar.baz:9080/Agent").
  with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><env:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:wsdl=\"http://agent.api.server.backup.r1soft.com/\" xmlns:env=\"http://schemas.xmlsoap.org/soap/envelope/\"><env:Body><getAgentByID><id>e9bd701b-dac1-4921-ab1c-467f35209e21</id></getAgentByID></env:Body></env:Envelope>",
       :headers => {'Accept'=>'*/*', 'Content-Length'=>'371', 'Content-Type'=>'text/xml;charset=UTF-8', 'Soapaction'=>'"getAgentByID"', 'User-Agent'=>'Ruby'}).
  to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getAgentByIDResponse xmlns:ns1=\"http://agent.api.server.backup.r1soft.com/\"><return><databaseAddOnEnabled>false</databaseAddOnEnabled><description>test-MSSQL</description><hostname>46.20.232.228</hostname><id>e9bd701b-dac1-4921-ab1c-467f35209e21</id><osType>WINDOWS</osType><portNumber>1167</portNumber></return></ns1:getAgentByIDResponse></soap:Body></soap:Envelope>", :headers => {})
  
stub_request(:post, "http://foo:bar@foo.bar.baz:9080/DiskSafe").
  with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><env:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:wsdl=\"http://disksafe.api.server.backup.r1soft.com/\" xmlns:env=\"http://schemas.xmlsoap.org/soap/envelope/\"><env:Body><getDiskSafesForAgent><agent><id>e9bd701b-dac1-4921-ab1c-467f35209e21</id></agent></getDiskSafesForAgent></env:Body></env:Envelope>",
       :headers => {'Accept'=>'*/*', 'Content-Length'=>'405', 'Content-Type'=>'text/xml;charset=UTF-8', 'Soapaction'=>'"getDiskSafesForAgent"', 'User-Agent'=>'Ruby'}).
  to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getDiskSafesForAgentResponse xmlns:ns1=\"http://disksafe.api.server.backup.r1soft.com/\"><return><agentID>e9bd701b-dac1-4921-ab1c-467f35209e21</agentID><backupPartitionTable>true</backupPartitionTable><backupUnmountedDevices>true</backupUnmountedDevices><bytesOnDisk>20931331073</bytesOnDisk><compressionLevel>LOW</compressionLevel><compressionType>QUICKLZ</compressionType><deltasInDiskSafe>6920703</deltasInDiskSafe><description>test-MSSQL</description><deviceBackupType>AUTO_ADD_DEVICES</deviceBackupType><deviceCount>2</deviceCount><deviceList><allocatedBlocks>7843190</allocatedBlocks><blockSize>4096</blockSize><capacity>64421359616</capacity><contentID>0004AFF104AFE7BC</contentID><deviceContentType>NTFS</deviceContentType><devicePath>\\\\?\\Volume{1b1cac04-b25f-11e0-bc49-806e6f6e6963}</devicePath><enabled>true</enabled><mountPoint>C:\\</mountPoint><mounted>true</mounted><totalBlocks>15727871</totalBlocks></deviceList><diskSafeAttributeMap><entry><key>ARCHIVING_ENABLED</key><value>true</value></entry><entry><key>FILE_EXCLUDES_ENABLED</key><value>true</value></entry><entry><key>QUOTA_TYPE</key><value>NONE</value></entry><entry><key>CONTROLPANELS_ENABLED</key><value>true</value></entry><entry><key>ARCHIVE_POINT_LIMIT</key><value>-1</value></entry><entry><key>RECOVERY_POINT_LIMIT</key><value>-1</value></entry><entry><key>SOFT_QUOTA_VALUE</key><value>-1.0</value></entry><entry><key>REPLICATION_FREQUENCY_LIMIT</key><value>NO_LIMIT</value></entry><entry><key>HARD_QUOTA_VALUE</key><value>-1.0</value></entry></diskSafeAttributeMap><id>3067f030-9814-4314-ae03-75933ac29e37</id><open>true</open><path>/data/test-volume/3067f030-9814-4314-ae03-75933ac29e37</path><recoveryPointCount>2</recoveryPointCount><size>20931331073</size><sizeOfDeltasInDiskSafe>18665326744</sizeOfDeltasInDiskSafe><totalFreePages>0</totalFreePages><totalFreePagesBytes>0</totalFreePagesBytes><totalPageBytes>20924334080</totalPageBytes><totalPageCount>638560</totalPageCount><volumeID>9b77052e-e1d3-4c51-a49a-51544fcb12e1</volumeID></return></ns1:getDiskSafesForAgentResponse></soap:Body></soap:Envelope>", :headers => {})  

  stub_request(:post, "http://foo:bar@foo.bar.baz:9080/RecoveryPoints").
    with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><env:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:wsdl=\"http://recoverypoints.api.server.backup.r1soft.com/\" xmlns:env=\"http://schemas.xmlsoap.org/soap/envelope/\"><env:Body><getRecoveryPoints><diskSafe><id>3067f030-9814-4314-ae03-75933ac29e37</id></diskSafe><includeMerged>false</includeMerged></getRecoveryPoints></env:Body></env:Envelope>",
         :headers => {'Accept'=>'*/*', 'Content-Length'=>'447', 'Content-Type'=>'text/xml;charset=UTF-8', 'Soapaction'=>'"getRecoveryPoints"', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns1:getRecoveryPointsResponse xmlns:ns1=\"http://recoverypoints.api.server.backup.r1soft.com/\"><return><agentID>e9bd701b-dac1-4921-ab1c-467f35209e21</agentID><createdOnTimestampInMillis>1330361712361</createdOnTimestampInMillis><diskSafeID>3067f030-9814-4314-ae03-75933ac29e37</diskSafeID><recoveryPointID>1</recoveryPointID><recoveryPointState>AVAILABLE</recoveryPointState></return><return><agentID>e9bd701b-dac1-4921-ab1c-467f35209e21</agentID><createdOnTimestampInMillis>1330427016495</createdOnTimestampInMillis><diskSafeID>3067f030-9814-4314-ae03-75933ac29e37</diskSafeID><recoveryPointID>2</recoveryPointID><recoveryPointState>AVAILABLE</recoveryPointState></return></ns1:getRecoveryPointsResponse></soap:Body></soap:Envelope>", :headers => {})