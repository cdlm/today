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

require 'minitest/unit'

MiniTest::Unit.autorun