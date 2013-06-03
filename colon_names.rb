File.open('sample_input.txt', 'r') do |f1|  

#for the @ symbol
   while line = f1.gets
   puts line
   puts line.scan(/\@\w+/)
	end
end  