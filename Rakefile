# encoding: utf-8
require 'rubygems'
require "bundler/gem_tasks"

task :default => :prepare
task :install => :prepare

task :prepare do
  require 'lock_jar'

  # get jarfile relative the gem dir
  LockJar.install('Jarfile.lock', local_repo: File.expand_path("../jars", __FILE__))
end

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `jruby -S bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
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

require 'rdoc/task'
require 'ruby-band/version'

Rake::RDocTask.new do |rdoc|
  version = RubyBand::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-band #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
