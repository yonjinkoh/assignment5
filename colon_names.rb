#add speaker class definition
require_relative 'Speaker'
require_relative 'Parser'
require_relative 'Adjacency'
require 'Matrix'
require_relative 'Find_Connections'

File.open('sample_input.txt', 'r') do |f1|  

	  while line = f1.gets

	  	parsed = Parser.new(line)

		# puts line

		# #Gets the speaker name
		# speaker = line[/\w+/]

		# #Gets the spoken to name(s)
		# speakee = line.scan(/\@\w+/)
		# speakee.map!{ |element| element.gsub(/@/, '') }

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
	
	connections_hash = Speaker.connections
	


	#Example code to get connections from first speaker
	# example = Speaker.list_connections(Speaker.list_speakers.first)

	# #Example code to get all speakers
	all_speakers = Speaker.list_speakers
	# #puts test.all_speakers
	# puts all_speakers
	# example.each do |name| 
	# puts name
	# #puts all_speakers.class
	# puts all_speakers.index(name)
	# end
	puts all_speakers
	test = Adjacency.new(connections_hash)
	new_matrix = test.make_matrixarray
	sym = test.symmetrize(new_matrix)
	# hello = Find_Connections.new(test)

	puts test.matrix_to_connections(sym).inspect

end