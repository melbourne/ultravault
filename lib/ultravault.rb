module UltraVault

  require 'savon'
  require 'ostruct'
  require_relative "ultravault/config"
  
  autoload :Agent,                "ultravault/v1/data_objects/agent"
  autoload :AgentService,         "ultravault/v1/soap_service/agent_service"
  autoload :ApiRequest,           "ultravault/api_request"
  autoload :Client,               "ultravault/client"
  autoload :DiskSafe,             "ultravault/v1/data_objects/disk_safe"
  autoload :DiskSafeService,      "ultravault/v1/soap_service/disk_safe_service"
  autoload :RecoveryPoint,        "ultravault/v1/data_objects/recovery_point" 
  autoload :RecoveryPointService, "ultravault/v1/soap_service/recovery_point_service" 
  autoload :SoapService,          "ultravault/soap_service"
  autoload :Policy,               "ultravault/v1/data_objects/policy"
  autoload :PolicyService,        "ultravault/v1/soap_service/policy_service"
  
end
