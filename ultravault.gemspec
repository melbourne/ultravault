Gem::Specification.new do |gem|
  gem.name    = "ultravault"
  gem.version = "1.0.1"

  gem.homepage    = "http://github.com/melbourne/ultravault"
  gem.summary     = "UltraVault"
  gem.description = <<-EOS
    UltraVault Interface
  EOS

  gem.files = `git ls-files`.split("\n")
  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "shoulda"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "vcr"
  
  gem.add_dependency "savon"

  gem.author = "Carpet & Sean"
  gem.email  = "andrew.turner@melbourne.co.uk;sean.handley@melbourne.co.uk"
end
