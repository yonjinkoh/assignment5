#add speaker class definition
require 'Speaker'

File.open('sample_input.txt', 'r') do |f1|  

	  while line = f1.gets
		puts line

		#Gets the speaker name
		speaker = line[/\w+/]

		#Gets the spoken to name(s)
		speakee = line.scan(/\@\w+/)
		speakee.map!{ |element| element.gsub(/@/, '') }

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
	example = Speaker.list_connections(Speaker.list_speakers.first).inspect
	puts example

	#Example code to get all speakers
	all_speakers = Speaker.list_speakers.inspect
	#puts test.all_speakers
	puts all_speakers
	example.each {|example| puts all_speakers.index(example)}

end