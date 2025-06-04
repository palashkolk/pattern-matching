login = {username:'hornby', password: 'iliketrains'}

login => {username:username}
puts "Logged in with username #{username}"

############### Return values #################
grade ='C'

result = case grade
  in 'A' then 1
  in 'B' then 2
  in 'C' then 3
  else 0
end

puts result
################ Object matching ################
input = '3'

case input
in String then puts 'Input was of type String'
in Integer then puts 'Input was of type Integer'
end

############### Variable pattern #################
age = 15
case age
in a
  puts a
end

a = 5
case 1
in a
  puts a
end

a = 7
case 1
in ^a
  puts 'match'
else puts 'No match'
end
#############################