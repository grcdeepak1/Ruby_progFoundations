def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
 		dot_separated_words.each do |word|
 			puts "#{word}"
			return false if !is_a_number?(word)
  	end
  	true
  else 
  	false
	end
end

def is_a_number?(word)
	/^\d+$/.match(word)
end
puts dot_separated_ip_address?("10.20.1.1")
puts dot_separated_ip_address?("10.20.1")
puts dot_separated_ip_address?("10.20.1.1.2")
puts dot_separated_ip_address?("a10.20.1.1.2")
puts dot_separated_ip_address?("10.2-0.1.1.2")

