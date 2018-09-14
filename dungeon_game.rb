class Dungeon
	attr_accessor :player
	
		
	def initialize(player_name)
		@name = Player.new(player_name)
		@rooms = []
	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	def start(location)
		@player_location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player_location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect {|room| room.reference == reference}
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player_location).connections[direction]
	end

	def go(direction)
		puts "You go " + direction.to_s
		@player_location = find_room_in_direction(direction)
		show_current_description
	end

	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end

	class Room
		attr_accessor :reference, :name, :description, :connections

		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			@name + "\n\nYou are in " + @description
		end
	end

end

#create new Dungeon
one_dungeon = Dungeon.new("Ted")

#add rooms
one_dungeon.add_room(:batcave, "Batcave", "a dark wet cave", {
	:west => :smallcave
})
one_dungeon.add_room(:smallcave, "Small Cave", "a room the size of a walkin closet", {
	:east => :batcave
})

#start
one_dungeon.start(:smallcave)

one_dungeon.go(:east)