# encoding: utf-8
require 'today/entry'
require 'yaml'

module Today
  class Journal
    attr_accessor :store_path

    def initialize store_path=nil
      @store_path = File.expand_path(store_path || Today::DEFAULT_STORE_PATH)
      @entries = self.load
    end

    def all_entries
      @entries
    end

    def last_entry
      @entries.last
    end

    def record text
      @entries << Entry.new(text)
    end

    def load
      YAML.load_file @store_path
    rescue Errno::ENOENT
      []
    end

    def save
      File.open @store_path, 'w' do |io|
        YAML.dump @entries, io
      end
    end
  end
end
