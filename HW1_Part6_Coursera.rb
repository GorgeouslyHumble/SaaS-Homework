class Numeric

 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

 def self.add_currency(currency, conversion)
 	@@currencies[currency.to_s] = conversion
 end

 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    return self / @@currencies[singular_currency]
  end
end

class String
  def palindrome?
    strip = self.gsub(/\W/, '').downcase
    if strip == strip.reverse
      puts "true"; return true
    else
      puts "false"; return false
    end
  end
end

class Range
  def palindrome?
    puts "That's not a palindrome."; return false
  end
end


class Enumerator
  def palindrome?
    if self.reverse_each == self
      puts "That's a palindrome."; return true
    else
      puts "That's not a palindrome."; return false
    end
  end
end

class Enumerators
  def palindrome?
    if self.reverse_each == self
      puts "That's a palindrome."; return true
    else
      puts "That's a palindrome."; return false
    end
  end
end

class ValidPalindromeTest < Array
  def palindrome?
    if self.reverse == self
      puts "That's a palindrome."; return true
    else
      puts "That's not a palindrome."; return false
    end
  end
end


class Array
  def palindrome?
    if self.reverse == self
      puts "true"; return true
    else
      puts "false"; return false
    end
  end
end

class Hash
  def palindrome?
    puts "That's not a palindrome."; return false
  end
end

stuff = 1.upto(10)
hash = { 'foo' => 1, 'bar' => 2 }

(1..10).palindrome?
hash.palindrome?
stuff.palindrome?

#{}"string".palindrome?

#{}"A man, a plan, a canal -- Panama".palindrome?

#[1,2,3,2,1].palindrome?