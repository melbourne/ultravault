require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "#{File.dirname(__FILE__)}/test/all.rb"
end

desc "Run tests"
task :default => :test