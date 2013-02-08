require_relative 'v1/disk_safe'
require_relative 'v2/disk_safe'

module UltraVault
  klass = eval "UltraVault::DiskSafeV" + UltraVault.config.api_version.to_s
  class DiskSafe < klass
    def initialize(params)
      super
    end
  end
end
