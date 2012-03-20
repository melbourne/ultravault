module UltraVault

  require 'savon'
  require_relative "ultravault/config"
  
  autoload :Agent,                "ultravault/agent"
  autoload :AgentService,         "ultravault/agent_service"
  autoload :ApiRequest,           "ultravault/api_request"
  autoload :Client,               "ultravault/client"
  autoload :DiskSafe,             "ultravault/disk_safe"
  autoload :DiskSafeService,      "ultravault/disk_safe_service"
  autoload :RecoveryPoint,        "ultravault/recovery_point" 
  autoload :RecoveryPointService, "ultravault/recovery_point_service" 
  autoload :SoapService,          "ultravault/soap_service"
  
end