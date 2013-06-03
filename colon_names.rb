File.open('sample_input.txt', 'r') do |f1|  

	while line = f1.gets
	puts line
	#puts the speaker name
    puts line[/\w+/]
    #puts the recipient
    puts line.scan(/\@\w+/)
	end
end