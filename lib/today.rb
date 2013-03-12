# encoding: utf-8
require 'today/version'
require 'today/journal'

module Today
  DEFAULT_STORE_PATH = '~/.today'

  def self.journal
    Journal.new
  end
end
