#structure
#season
	#total days per season
	#mountains
		#total days per mountain

#abilities
	#add days to specific mountain
	#total days of all mountains within a season

class Seasons
	attr_reader :season_total, :mountains

	def initialize(year)
		@year = year
		@season_total = 0
		@mountains = {}
		@resort = {}
	end

	def add_day(date, resort)
		#add resort to list of mountains if it's not already there
		#add date to resort, count total days at that resort
		@resort
		@mountains[resort] = date #this will replace the previous date, need to keep running log of all days at a resort
		@season_total += 1
		puts "you rode #{resort} on #{date}"
		display_total
	end

	protected

	def display_total
		puts "#{@year}-#{@year+1} season: #{@season_total} days"
	end
end

year1 = Seasons.new(2017)
year1.add_day("11/15/17", "Northstar")
year1.add_day("12/1/17", "Northstar")
puts year1.mountains
