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
some_other_value = true

case 0
in 0 if some_other_value
  puts :match
else puts :no_match
end

################# Array pattern match #############
arr = [1, 2]

case arr
in [1,2] then puts :match
in [3,4] then puts :no_match
else puts :no_match
end

case arr
in [Integer, Integer] # Matching against pattern rather than actual value
  puts :type_match
in [String, String]
  puts :no_match
end

arr = [1,2,3]
case arr
in [Integer, Integer]
  puts :no_match
else puts :no_match_due_to_array_size_difference
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
case arr
in [Integer, Integer, *, Integer, 10] #mixings of values and type in matching
  puts :size_match_with_star
else puts :no_match_due_to_array_size_difference
end

arr = [1,2,3,4]
case arr
in [_,_,*tail] # '_' is used to match against any value we don't care about; *tail picks up rest elements 
  puts tail
end

arr = [1, 1]

case arr
in [a, b] unless a == b
  puts :guard_condition_met
else puts 'Guard condition have not met'
end

arr = [1, 2, [3, 4]]

case arr
in [_, _, [3, 4]] # Nested array match
  puts :match
end

case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  puts a
  p arr
end

################# Hash pattern match ###################
#Pattern matching only works for symbols as keys and not strings as keys

case {a:'apple', b:'banana'}
in {a:'aardvark', b:'bat'}
  puts :no_match
in { a:'apple', b:'banana' }
  puts :match
end

case {a:'apple', b:'banana'}
in {a:var, b:} #We don't have to provide names for variables
  puts var
  puts b
end

case {a:'amla', b:'blue'}
in a:, b:
  puts a
  puts b
end

case { a: 'ant', b: 'ball', c: 'cat' }
in { a:'ant', **rest}
p rest
end

#hash will match with only a subset of keys matching
case { a: 'ant', b: 'ball' }
in { a: 'ant' }
  'this will match'
in { a: 'ant', b: 'ball' }
  'this will never be reached'
end
# to avoid above problem use **nil
case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end

case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash #Entire case is assgned to hash as it is a match
  p hash
end

###################################
