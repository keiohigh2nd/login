# -*- coding: utf-8 -*-

def memai(text)
  text = ["ベッドに横にならなければならないですか？",
	 "急に発症しましたか?",
	 "症状は再発しますか？",
	 "症状は朝が多いですか?"
        ] 
  return text
end

def main_answer(text)
  if text.include?("めまい") == true
    return memai(text)
  end
end

def answer(text)
  return "--"
end

if __FILE__ == $0
  p main_answer("めまい")
end
