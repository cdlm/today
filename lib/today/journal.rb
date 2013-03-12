# encoding: utf-8
require 'today/entry'

module Today
  class Journal

    def initialize
      @entries = []
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
  end
end
