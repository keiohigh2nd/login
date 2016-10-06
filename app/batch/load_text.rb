
texts = ""

File.open('/Users/keiohigh2nd/deepKarte/RB/output/sum.txt') do |file|
  file.read.split("\n").each do |labmen|
    texts += labmen
  end
end
# 例外は小さい単位で捕捉する


user = User.find_by(email:"keiohigh2nd@gmail.com")
note1 = user.notes.build(note_date: Time.now, note: texts)
note1.save


