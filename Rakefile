require 'rake/testtask'

task default: %w(test)

Rake::TestTask.new do |t|
  t.verbose = true
  t.pattern = "test/*_test.rb"
end

task :run do
  ruby "bin/l33xor.rb"
end
