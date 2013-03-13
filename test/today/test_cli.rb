# encoding: utf-8
require_relative '../helper'
require 'today/cli'

describe Today::CLI do
  include FakeFS::SpecHelpers

  before do
    FileUtils.mkdir_p File.expand_path('~')
  end

  it 'provides help' do
    proc {
      begin
        Today::CLI.run %w(--help)
      rescue SystemExit => exit_status
        exit_status.must_be :success?
      end
    }.must_output /show help for this command/, ''
  end

  it 'consults entries' do
    skip 'not yet implemented'
    proc {
      Today::CLI.run []
    }.must_output /no entries/
  end

  describe 'with an existing journal' do
    before do
      Today.journal.record 'been there'
      Today.journal.record 'done that'
    end

    it 'records an entry' do
      skip 'not yet implemented'
      Today::CLI.run %w(I wrote some tests)
      Today.journal.last_entry.text.must_be 'wrote some tests'
    end

    it 'consults entries' do
      skip 'not yet implemented'
      proc {
        Today::CLI.run []
      }.must_output /been there.*done that.*wrote some tests/
    end
  end
end
