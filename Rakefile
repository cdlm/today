# encoding: utf-8

require 'rubygems'

begin
  require 'bundler'
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler."
  exit -1
end

begin
  Bundler.setup(:development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems."
  exit e.status_code
end

require 'rake'

task :default => :test

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/test_*.rb"
end

require 'yard'
YARD::Rake::YardocTask.new  
task :doc => :yard

require "bundler/gem_tasks"
