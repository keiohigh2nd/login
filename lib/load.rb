# -*- coding: utf-8 -*-

def answer(text)
  if text == "疲れました"
    return "どの辺りが疲れていますか?"
  elsif text.include?("すか") == true
    return "ただいま医師に確認いたします"
  elsif text.include?("めまい") == true
    return "いつからですか？頭痛や胸痛はありますか?"
  elsif text.include?("熱") == true
    return "熱は何度ですか?"
  elsif text.include?("お腹が痛い") == true
    return "吐き気はしますか?"
  elsif text.include?("痛") == true
    return "何時頃からですか? またどの程度痛みますか?"
  else
    return 0
  end
end

if __FILE__ == $0
  p answer("疲れました")
  p "--------------"
  p answer("頭が痛いです")
end
