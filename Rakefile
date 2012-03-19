require 'rake/testtask'

Rake::TestTask.new("unit") do |t|
  t.libs << 'test'
  t.pattern = "#{File.dirname(__FILE__)}/test/all.rb"
end

Rake::TestTask.new("integration") do |t|
  t.libs << 'test'
  t.pattern = "#{File.dirname(__FILE__)}/test/integration/client_code.rb"
end

desc "Run tests"
task :default => :unit