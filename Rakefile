# encoding: utf-8

require "bundler/gem_tasks"

task :default => :prepare

task :prepare do
  require 'lock_jar'

  # get jarfile relative the gem dir
  LockJar.install('Jarfile.lock', local_repo: File.expand_path("../jars", __FILE__))
end

require 'rake'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features)

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
#  test.pattern = 'test/**/test_*.rb'
  test.test_files = FileList['test/test_*.rb']
  test.verbose = true
end

task :test => [] do
  begin
    Rake::Task[:test].invoke
  rescue
  end
  Rake::Task[:features].invoke
end

#require 'rcov/rcovtask'
#Rcov::RcovTask.new do |test|
#  test.libs << 'test'
#  test.pattern = 'test/**/test_*.rb'
#  test.verbose = true
#  test.rcov_opts << '--exclude "gems/*"'
#end

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-band #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
