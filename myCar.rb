module Tricks
	def drift(turn)
		@current_speed -= 10
		display("You pull the ebrake on a #{turn} turn and drifffftttttt around the bend")
	end
end

class Vehicle
	
	@@total_vehicles = 0

	def self.count_vehicles
		puts "total vehicles created:"
		puts @@total_vehicles
	end
	
	def initialize
		@@total_vehicles += 1
	end

	def display(message)
		puts message
	end
	
	def spray_paint(color)
		self.color = color
		display("Your car is now #{self.color}")
	end

	def to_s
		display("This car was built in #{self.year}. Its current color is #{self.color}.")
	end

	def self.mpg(miles, gallon)
		mpg = miles / gallon
		puts "That car's gas milage is #{mpg}mpg"
		# display("Your car's gas milage is #{rand(50)}")
	end
end

class MyCar < Vehicle
	include Tricks

	attr_accessor :current_speed, :color
	attr_reader :year

	VIN = 92683


	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
		@@total_vehicles += 1
	end

	def accelerate(mph)
		@current_speed += mph
		display("You're currently driving #{@current_speed}!")
	end

	def brake(mph)
		@current_speed -= mph
		display(@current_speed <= 0 ? "You completely stop and park the car" : "You slow the car down to #{@current_speed}")
	end

	def turn_off
		if @current_speed > 0
			display("You can't turn off the car while it's still moving! You're still going #{@current_speed}")
		else 
			@current_speed = 0
			display("You turn off the car.")
		end
	end

end

class MyTruck < Vehicle

	VIN = 94113

end



dodge = MyCar.new(92, "grey", "shadow")
dodge2 = MyCar.new(83, "black", "windor")
focus = MyTruck.new
focus2 = MyTruck.new
puts Vehicle.count_vehicles
dodge.drift("right")

