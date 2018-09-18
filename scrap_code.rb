module Stuff
	def greeting
		puts "sup world! I'm from the bench!"
	end
end

class Person
	include Enumerable

	def initialize(days)
		@days = days
	end

	def each
		idx = 0
		while idx < self.size
			yield(idx)
			idx += 1
		end
		self
	end

	def days
		@days
	end

	def difference_in_days(other_person)
		difference = (self.days - other_person.days).abs
	end

	def add_days(other_person)
		self.days + other_person.days
	end

	# private :days
	# protected :days
end

tod = Person.new([1,2,3])
ted = Person.new(30)

puts tod.days.map {|item| item * item}