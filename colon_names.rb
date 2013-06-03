#add speaker class definition
require 'Speaker'

test = Speaker.new("test")
$Big_List = []

File.open('complex_input.txt', 'r') do |f1|  

	 while line = f1.gets
		puts line

		speaker = line[/\w+/]
		speakee	= line.scan(/\@\w+/)
		#puts the speaker name
	    puts "speaker is #{speaker}"
	    #puts the recipient
	    puts "speaker is #{speakee}"

	    	#Checks if speaker exists
			if test.include?(speaker)
			#puts test.list_speakers

			else	
			#if doesn't exists create new person
			speaker = Speaker.new(speaker)
			speaker.spoken_to << speakee
			#puts speaker.spoken_to.inspect

			$Big_List << speaker
			puts "Big List #{$Big_List.inspect}"

			end
	
	end

	puts $Big_List.inspect

end