# -*- coding: utf-8 -*-

def order(users)
  p users
  ordered_users = []
  for user in users do 
    tmp = 0
    for n in user.notes[-3,3] do 
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
