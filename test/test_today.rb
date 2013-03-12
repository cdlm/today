# encoding: utf-8
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

  it 'has a default data root' do
    root = Today.const_get('DEFAULT_STORE_PATH')
    root.wont_be_empty
  end

  describe 'a new instance' do
    subject { Today.journal }

    it 'has no entries' do
      subject.all_entries.wont_be_nil
      subject.all_entries.must_be_empty
    end

    it 'can record an entry' do
      subject.record "something interesting"
      subject.all_entries.wont_be_empty
      subject.last_entry.text.must_equal "something interesting"
    end
  end
end
