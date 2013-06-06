#add speaker class definition
require_relative 'Speaker'
require_relative 'Parser'
require_relative 'Adjacency'
require 'Matrix'
require_relative 'Find_Connections'

File.open('complex_input.txt', 'r') do |f1|  

	#Parses text file line-by-line to get
	#list of speakers and recipients
	while line = f1.gets

	  	parsed = Parser.new(line)
		speaker = parsed.sender
		speakee = parsed.receiver

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
	
	#Get the connections as has
	connections_hash = Speaker.connections

	#output file with answer
	test = Adjacency.new(connections_hash)
	test.produce_connections

end