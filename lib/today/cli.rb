# -*- encoding : utf-8 -*-
require 'today'

require 'cri'
require 'colored'

module Today
  module CLI

    def self.run(args)  root_command.run(args)  end

    def self.root_command
      @root ||= self.load_commands
    end

    def self.load_commands
      root_definition = File.dirname(__FILE__) + '/cli/root_command.rb'
      root_command = load_command_at root_definition, 'today'
      root_command.add_command Cri::Command.new_basic_help

      Dir[ File.dirname(__FILE__) + '/cli/commands/*.rb' ].each do |command_definition|
        new_command = load_command_at command_definition
        root_command.add_command new_command
      end
      root_command
    end

    def self.load_command_at filename, command_name=nil
      new_command = Cri::Command.define(File.read(filename), filename)
      new_command.modify { name command_name || File.basename(filename, '.rb') }
      new_command
    end
  end
end
