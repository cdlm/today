# -*- encoding : utf-8 -*-
require 'rubygems'

begin
  require 'bundler'
  Bundler.setup(:default, :development, :test)
rescue LoadError => e
  STDERR.puts e.message, "Run `gem install bundler` to install Bundler."
  exit -1
rescue Bundler::BundlerError => e
  STDERR.puts e.message, "Run `bundle install` to install missing gems."
  exit e.status_code
end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new

# Some tested code could exit unexpectedly, we want minitest to puke it like any
# other exception instead of getting some ridiculously unrelated NPE
MiniTest::Unit::TestCase::PASSTHROUGH_EXCEPTIONS.delete SystemExit

require 'fakefs/safe'
require 'fakefs/spec_helpers'

require 'timecop'
