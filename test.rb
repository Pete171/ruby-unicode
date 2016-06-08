require 'minitest/autorun'

$:.unshift File.dirname(__FILE__)
require 'code'

class CodeTest < Minitest::Test
  def test_unicode_to_utf8
    code = Code.new
    assert_equal(0x24, code.unicode_to_utf8(0x0024))
    assert_equal(0xC2A2, code.unicode_to_utf8(0x00A2))
    assert_equal(0xE282AC, code.unicode_to_utf8(0x20AC))
    assert_equal(0xF0908D88, code.unicode_to_utf8(0x010348))
  end

  def test_utf8_to_unicode
    code = Code.new
    assert_equal(0x0024, code.utf8_to_unicode(0x24))
    #assert_equal(0x00A2, code.utf8_to_unicode(0xC2A2))
    #assert_equal(0x20AC, code.utf8_to_unicode(0xE282AC))
    #assert_equal(0x010348, code.utf8_to_unicode(0xF0908D88))
  end
end
