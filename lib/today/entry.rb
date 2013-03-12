# encoding: utf-8

module Today
  class Entry

    attr_reader :text
    attr_reader :record_date

    def initialize text
      @record_date = Time.now
      @text = text
    end

    def age
      Time.now - record_date
    end
  end
end
