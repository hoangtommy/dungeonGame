while 1
	puts "enter a number"
	begin
		num = Kernel.gets.match(/\d+/)[0]
	rescue
		puts "please enter in a digit"
	else
		puts "#{num} + 1 is #{num.to_i + 1}"
	end
end