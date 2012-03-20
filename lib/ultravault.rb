module UltraVault

  require 'savon'
  require_relative "ultravault/config"
  
  autoload :Agent,                "ultravault/data_objects/agent"
  autoload :AgentService,         "ultravault/soap_service/agent_service"
  autoload :ApiRequest,           "ultravault/api_request"
  autoload :Client,               "ultravault/client"
  autoload :DiskSafe,             "ultravault/data_objects/disk_safe"
  autoload :DiskSafeService,      "ultravault/soap_service/disk_safe_service"
  autoload :RecoveryPoint,        "ultravault/data_objects/recovery_point" 
  autoload :RecoveryPointService, "ultravault/soap_service/recovery_point_service" 
  autoload :SoapService,          "ultravault/soap_service"
  
end