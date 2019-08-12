# Given an array of usernames like ['maria', 'joao', 'maria', 'maria', 'joao'],
# return an array of unique usernames like ['maria', 'joao', 'maria1', 'maria2', 'joao2']
#


def username_exists?(usernames, username)
  !usernames[username].nil?
end

def increment_username(username)
  previous_number = username.gsub(/\D/, '')
  username_without_numbers = username.tr("0-9", "")
  previous_number_plus_one = previous_number.to_i + 1
  new_username = "#{username_without_numbers}#{previous_number_plus_one}"
end

def process_username(usernames, username)
  if username_exists?(usernames, username)
    new_username = increment_username(username)
    process_username(usernames, new_username)
  else
    username
  end
end

def usernames_system(u)
  indexed_usernames = {}
  u.map do |name|
    username = process_username(indexed_usernames, name)
    indexed_usernames[username] = username
    username
  end
end



