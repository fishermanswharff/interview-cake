def is_palindrome?(string)
  for i in 0...(string.length/2).floor
    return string[i] == string[string.length - i - 1]
  end
end

# p palin("poop")
# p palin('mother')
# p palin('POop')
# p palin('racecar')
# p palin('mom')

=begin
take the string.length/2

loop through the first half of the string
compare string[i] with string[length - i - 1]

racecar

mother

loop 0:
string[i] = m
string[length - i - 1] = r

loop 1:
string[i] = o
string[length - i - 1] = e
=end