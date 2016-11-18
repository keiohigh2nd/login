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
  elsif text.include?("腹が痛い") == true
    return "吐き気はしますか?"
  elsif text.include?("苦しい") == true
   return "いつからですか？なるべく早く来院して下さい"
  elsif text.include?("失神") == true
   return "心臓の病気はお持ちですか？"
  elsif text.include?("便秘") == true
   return "最近、体重は減っていますか"
  elsif text.include?("気持ち悪い") == true
   return "妊娠されていますか"
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
