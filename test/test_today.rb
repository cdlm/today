# encoding: utf-8
require_relative 'helper'
require 'today'
require 'fileutils'
require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/date/calculations'

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

    before do
      FileUtils.mkdir_p File.expand_path('~')
    end

    it 'has no entries' do
      subject.all_entries.wont_be_nil
      subject.all_entries.must_be_empty
    end

    it 'can record an entry' do
      subject.record 'something interesting'
      subject.all_entries.wont_be_empty
      subject.last_entry.text.must_equal 'something interesting'
      subject.last_entry.age.must_be :<=, 1
    end

    describe 'with a few entries' do
      before do
        Timecop.freeze 2.weeks.ago do
          subject.record 'an old entry'
        end
        Timecop.freeze 1.week.ago do
          subject.record 'another entry'
        end
      end

      it 'has the correct entries' do
        subject.all_entries.size.must_equal 2
        subject.last_entry.text.must_equal 'another entry'
        subject.last_entry.age.must_be :>=, 1.week
      end

      it 'saves to disk' do
        File.wont_be :exist?, subject.store_path
        subject.save
        File.must_be :exist?, subject.store_path
        reloaded_journal = Today.journal
        reloaded_journal.all_entries.size.must_equal 2
      end
    end
  end
end
