class MyCar
	attr_accessor :current_speed, :color
	attr_reader :year

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
	end

	def display(message)
		puts message
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

	def spray_paint(color)
		self.color = color
		display("Your car is now #{self.color}")
	end

	def to_s
		display("This car was built in #{self.year}. Its current color is #{self.color}.")
	end
end

dodge = MyCar.new(92, "grey", "shadow")
puts dodge.to_s