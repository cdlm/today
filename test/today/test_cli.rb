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

  it 'records an entry'
  it 'consults daily entries'
end
