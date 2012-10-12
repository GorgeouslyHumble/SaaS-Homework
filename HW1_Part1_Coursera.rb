#!/usr/bin/ruby

def palindrome?(string)
	strip = string.gsub(/\W/, '').downcase
	if strip == strip.reverse
		true
	else
		false
	end
end

palindrome?("A man, a plan, a canal -- Panama")  # => true
palindrome?("Madam, I'm Adam!")                  # => true
palindrome?("Abracadabra")                       # => false (nil is also ok)

def count_words(text)
	words = text.downcase.split(/[^a-zA-Z]/)
	freqs = Hash.new(0)
	words.each { |word| freqs[word] += 1 }
	freqs.delete_if { |word, count| word == "" }
	freqs.each { |word, count| puts "#{word} #{count}" }
end

count_words("A man, a plan, a canab-- Panama")
count_words "Doo bee doo bee doo" 
