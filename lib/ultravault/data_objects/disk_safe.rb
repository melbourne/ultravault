require_relative 'v1/disk_safe'
require_relative 'v2/disk_safe'

module UltraVault
  klass = Kernel.const_get "V" + UltraVault.config.api_version.to_s + "::DiskSafe"
  class DiskSafe < klass
    def initialize
      super
    end
  end
end
