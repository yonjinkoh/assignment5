#this is a test for printing our output in the format that we would like



a=[["alberta","bob"], 
[["bob", "christie"], ["alberta", "christie", "duncan"]],
[["duncan", "emily"], ["emily", "farid"]], 
[["farid"], []]]

# a.each_with_index do |num, idx|
# 	puts "this is #{num} and #{idx}" 
	
File.open('names.txt', 'w') do |f1|
	all_speakers = a[0]
	a_length = a.length
	all_speakers.each_with_index do |speaker, index| 
		a.each_with_index do |e,x|
			if e[index].class == Array
				if e[index].join(", ").length != 0
					f1.puts e[index].join(", ")
				end
			elsif e[index].class == String
				if e[index].length != 0
					f1.puts e[index]
				end
			end
		end
		f1.puts "\n"
	end


end

	# 	puts speaker
	# 	# puts "the first array of each subsequent array"
	# 	a.each_with_index do |e, x| 
	# 		new = a[x]
	# 		puts new[y].inspect
	# 		x += 1
	# 		y+=1
	# 	end
	# end



