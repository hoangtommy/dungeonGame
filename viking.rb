class Person
	def initialize
	end
end

class Viking < Person
	attr_accessor :name, :age, :health

	def initialize(name)
		@name = name
		@age = (rand * 80).round
		@health = @age + 30
	end

	def attack(other)
		damage = (rand * 20).round
		other.calc_damage(damage)
		puts "#{self.name} attacked #{other.name}. #{other.name} health is now #{other.health}"
	end

	protected
		def calc_damage(damage)
			self.health -= damage
			return die if self.health <= 0
		end

	private
		def die
			puts "#{self.name} is dead"
		end
end

olof = Viking.new("Olof")
folo = Viking.new("Folo")
puts olof.health
puts folo.health
12.times do 
	olof.attack(folo)
end