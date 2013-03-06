# -*- encoding : utf-8 -*-
require_relative 'helper'
require 'today'
require 'fileutils'

describe Today do
  include FakeFS::SpecHelpers

  it 'has a version number' do
    version = Today.const_get('VERSION')
    version.wont_be_empty
    version.must_match /\d+(\.\d+)+/
  end

  it 'has a default data root'
end
