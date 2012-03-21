dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(dir)

Dir["#{dir}/**/test_*.rb"].sort.each do |file|
  require file.sub(/^#{dir}\/(.*)\.rb$/, '\1')
end