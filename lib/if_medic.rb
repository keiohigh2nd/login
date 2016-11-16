# -*- coding: utf-8 -*-

def medic?(text)
  if text.include?("痛") == true
    return 1
  elsif text.include?("薬") == true
    return 1
  elsif text.include?("疲") == true
    return 1
  elsif text.include?("すか") == true
    return 1
  else
    return 0
  end
end

if __FILE__ == $0
  p medic?("痛み")
end
