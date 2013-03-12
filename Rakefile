# encoding: utf-8
require 'rubygems'
begin
  require 'bundler'
  Bundler.setup(:development)
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler."
  exit -1
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems."
  exit e.status_code
end

require 'rake'

task :default => :test

desc "Watch & run tests using guard"
task :guard do
  exec *%w(bundle exec guard)
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/**/test_*.rb"
end

require 'yard'
YARD::Rake::YardocTask.new  
task :doc => :yard

require "bundler/gem_tasks"
