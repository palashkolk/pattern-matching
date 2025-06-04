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
in a # Pattern match makes sure a = age
  puts a
end

a = 5
case 1
in a # no pinning operator makes sure a = 1 
  puts a
end

a = 7
case 1
in ^a  # pinning operator makes sure a=7; so 7 is match against 1
  puts 'match'
else puts 'No match'
end
############### As pattern match ##############
case 10
in 10 => a
  puts a
end

########### Alternative pattern macth ##############
a = 10
case 10
in 0|1|^a => var
  puts "Match found: #{var}"
else puts "No match found"
end

############## Guard conditions ###############
some_other_value = false

case 0
in 0 if some_other_value
  puts :match
else puts :no_match
end