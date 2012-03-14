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
    ruby-1.9.3-p0 :026 > client.request(:getVolumes)

produces the body:

	<?xml version="1.0"?>
	<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<soap:Body>
			<ns1:getVolumesResponse xmlns:ns1="http://volume.api.server.backup.r1soft.com/">
				<return>
					<description/>
					<hardQuota>1979120929996</hardQuota>
					<id>2bb5d10d-ed25-48b1-8eaa-1e0df2e129b4</id>
					<name>Internal Data Store</name>
					<onDiskSize>1422660809466</onDiskSize>
					<path>/data/internal</path>
					<quotaType>ON_DISK_SIZE</quotaType>
					<sizeOfDeltas>389319150</sizeOfDeltas>
					<softQuota>1649267441664</softQuota>
					<volumeAttributeMap>
						<entry>
							<key>ARCHIVE_POINT_LIMIT</key>
							<value>-1</value>
						</entry>
						<entry>
							<key>REPLICATION_FREQUENCY_LIMIT</key>
							<value>NO_LIMIT</value>
						</entry>
						<entry>
							<key>RECOVERY_POINT_LIMIT</key>
							<value>-1</value>
						</entry>
						<entry>
							<key>ARCHIVING_ENABLED</key>
							<value>true</value>
						</entry>
						<entry>
							<key>FILE_EXCLUDES_ENABLED</key>
							<value>true</value>
						</entry>
						<entry>
							<key>CONTROLPANELS_ENABLED</key>
							<value>true</value>
						</entry>
					</volumeAttributeMap>
				</return>
			</ns1:getVolumesResponse>
		</soap:Body>
	</soap:Envelope>

## Rails

Add this to your Gemfile:

  gem 'ultravault'

Run

  bundle install
