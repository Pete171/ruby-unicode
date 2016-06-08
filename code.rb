class Code
  def unicode_to_utf8 code_point
    if code_point <= 0x7F then
      code_point
    elsif code_point <= 0x7FF then
      _get_twobyte_char code_point
    elsif code_point <= 0xFFFF then
      _get_threebyte_char code_point
    else
      _get_fourbyte_char code_point
    end
  end

  def _get_twobyte_char code_point
    lowbyte = (code_point & 0b00111111) | 0b10000000
    highbyte = ((code_point >> 6) & 0b111111) | 0b11000000
    (highbyte << 8) + lowbyte
  end

  def _get_threebyte_char code_point
    lowest = (code_point & 0b00111111) | 0b10000000
    mid = ((code_point >> 6) & 0b111111) | 0b10000000
    top = ((code_point >> 12) & 0b111111) | 0b11100000
    (top << 16) + (mid << 8) + lowest
  end

  def _get_fourbyte_char code_point
    lowest = (code_point & 0b00111111) | 0b10000000
    mid1 = ((code_point >> 6) & 0b111111) | 0b10000000
    mid2 = ((code_point >> 12) & 0b111111) | 0b10000000
    top = ((code_point >> 18) & 0b111111) | 0b11110000
    (top << 24) + (mid2 << 16) + (mid1 << 8) + lowest
  end

  def utf8_to_unicode utf8 #TODO-this.
    #if utf8 & 11
    p (utf8 & 11110000).to_s(16);exit
    if utf8 & 11110000 then
      p "is 4"
    elsif utf8 & 11100000 then
      p "is 3"
    elsif utf8 & 11000000 then
      p "is 2"
    else
      p "is 1"
    end
    #p utf8 & 11000000;exit
  end
end
