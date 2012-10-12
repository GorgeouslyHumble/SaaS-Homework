class Dessert

	attr_accessor :calories
	attr_accessor :name

	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	def healthy?
		if (@calories < 200)
			return true
		else 
			return false
		end
	end

	def delicious?
		true
	end
end

class JellyBean < Dessert

	attr_accessor :flavor

	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end

	def delicious?
		if (flavor != "black licorice")
			super
		end
	end
end

black_jb = JellyBean.new("Black", 1000, "black licorice")
black_jb.delicious?
black_jb.healthy?

red_jb = JellyBean.new("Red", 100, "cherry")
red_jb.delicious?
red_jb.healthy?

blue_jb = JellyBean.new("Blue", 1000, "blueberry")
blue_jb.delicious?
blue_jb.healthy?

cake = Dessert.new("Cake", 600)
cake.delicious?
cake.healthy?

fruit = Dessert.new("Apple", 100)
fruit.delicious?
fruit.healthy?

fruit.name = "Pear"
puts fruit.name

if (fruit.delicious? == true)
	puts "Hello there!"
end