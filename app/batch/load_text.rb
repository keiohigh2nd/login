require "time"

def save_summarized_text()
  texts = ""

  File.open('/Users/keiohigh2nd/deepKarte/RB/output/sum.txt') do |file|
    file.read.split("\n").each do |labmen|
      texts += labmen
    end
  end

  user = User.find_by(email:"keiohigh2nd@gmail.com")
  note1 = user.notes.build(note_date: Time.now, note: texts)
  note1.save
end

def execute_each_sec(sleep_sec)
  yield
  sleep sleep_sec
end

if __FILE__ == $0

  10000.times do
    execute_each_sec(5) do ||
      save_summarized_text()
    end
  end
end
