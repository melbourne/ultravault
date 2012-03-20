module UltraVault

  require 'savon'
  require_relative "ultravault/config"
  
  autoload :Agent,                "./lib/ultravault/agent"
  autoload :AgentService,         "./lib/ultravault/agent_service"
  autoload :ApiRequest,           "./lib/ultravault/api_request"
  autoload :Client,               "./lib/ultravault/client"
  autoload :DiskSafe,             "./lib/ultravault/disk_safe"
  autoload :DiskSafeService,      "./lib/ultravault/disk_safe_service"
  autoload :RecoveryPoint,        "./lib/ultravault/recovery_point" 
  autoload :RecoveryPointService, "./lib/ultravault/recovery_point_service" 
  autoload :SoapService,          "./lib/ultravault/soap_service"
  
end