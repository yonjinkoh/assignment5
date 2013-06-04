#add speaker class definition
require 'Speaker'

# test = Speaker.new("test")
connections = Hash.new()


File.open('complex_input.txt', 'r') do |f1|  

	  while line = f1.gets
		puts line

		speaker = line[/\w+/]
		speakee = line.scan(/\@\w+/)
		#puts the speaker name
	    #puts "speaker is #{speaker.class}"
	    #puts the recipient
	    #puts "speakee is #{speakee.class}"

	    	#Checks if speaker exists
			if Speaker.list_speakers.include?(speaker)
			#if already exist then add speakee to list
			#for established speaker
			Speaker.append_speakee(speaker, speakee)
			
			else	
			#if doesn't exists create new person
			#add speakee to hash of class
			Speaker.new(speaker, speakee)

			end
	end
	
	#Example code to get connections from first speaker
	puts Speaker.list_connections(Speaker.list_speakers.first).inspect

	#Example code to get all speakers
	puts Speaker.list_speakers.inspect
	#puts test.all_speakers
end