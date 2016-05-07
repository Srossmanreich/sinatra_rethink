require 'rake'
require 'rspec/core/rake_task'


require ::File.expand_path('../config/environment', __FILE__)

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/environment"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs
