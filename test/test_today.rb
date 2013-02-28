# -*- encoding : utf-8 -*-
require 'helper'
require 'today'

class TestToday < MiniTest::Unit::TestCase

  def test_version
    version = Today.const_get('VERSION')

    assert(!version.empty?, 'should have a VERSION constant')
  end

end
