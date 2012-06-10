require 'rspec/core/rake_task'

# Usage:
# `rake` or `rake spec` -> run all specs
# `rake spec file` -> test one spec

task :default => :spec

RSpec::Core::RakeTask.new do |t|
  
  task = ARGV[0].scan(/\[([a-z]*)\]/)
  
  if task && task.size == 0
    t.pattern = "./specs/*.rb"
  else
    t.pattern = "./specs/#{task[0][0]}.rb"
  end
  
end