Gem::Specification.new do |gem|
  gem.name    = "ultravm"
  gem.version = "0.0.5"

  gem.homepage    = "http://github.com/melbourne/ultravault"
  gem.summary     = "UltraVault"
  gem.description = <<-EOS
    UltraVault Interface
  EOS

  gem.files = `git ls-files`.split("\n")
  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.author = "James Rose"
  gem.email  = "james.rose@melbourne.co.uk"
end
