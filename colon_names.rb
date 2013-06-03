#add speaker class definition
require 'Speaker'

test = Speaker.new("test")

File.open('sample_input.txt', 'r') do |f1|  

	 while line = f1.gets
		puts line

		speaker = line[/\w+/]
		speakee	= line.scan(/\@\w+/)
		#puts the speaker name
	    puts speaker
	    #puts the recipient
	    puts speakee

	    	#Checks if speaker exists
			if test.include?(speaker)
			puts test.list_speakers

			else	
			#if doesn't exists create new person
			speaker = Speaker.new(speaker)
			speaker.spoken_to << speakee
			puts speaker.spoken_to
			end
	
	end

	puts test.list_speakers

end