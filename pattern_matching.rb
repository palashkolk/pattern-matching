login = {username:'hornby', password: 'iliketrains'}

login => {username:username}
puts "Logged in with username #{username}"

grade ='C'

result = case grade
  in 'A' then 1
  in 'B' then 2
  in 'C' then 3
  else 0
end

puts result