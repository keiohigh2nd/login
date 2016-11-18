# -*- coding: utf-8 -*-

def order(users)
  ordered_users = []
  tmp = 0
  for user in users do 
    if user.notes.length < 1
      ordered_users.push(user)
      next
    end 
    for n in user.notes[-1,1] do 
      if n.note.include?("胸") == true
        ordered_users.unshift(user)
        tmp = 1
        break
      end
    end
    if tmp == 0
      ordered_users.push(user)
    end
  end
  return ordered_users
end

if __FILE__ == $0
  test = [1,2,3,4]
  p test[-2,2]
end
