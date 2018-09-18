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
		if @mountains.include? resort 
			@mountains[resort] << date
		else
			@mountains[resort] ||= [date]
		end
		@season_total += 1
		puts "you rode #{resort} on #{date}"
		puts "#{resort} total: #{@mountains[resort].size}"
	end

	def display
		display_total
	end

	protected

	def display_total
		puts "All resorts: #{@mountains.keys}"
		puts "#{@year}-#{@year+1} season: #{@season_total} days"
	end
end

year1 = Seasons.new(2017)
year1.add_day("11/15/17", "Northstar")
year1.add_day("12/1/17", "Kirkwood")
year1.add_day("12/1/17", "Northstar")
year1.add_day("1/2/18", "Whistler")
year1.display