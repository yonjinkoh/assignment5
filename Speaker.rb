class Speaker
attr_reader :spoken_to,:name
@@all_speakers = []
$connections = Hash.new

	def initialize(name, speakee)
		@name = name.to_sym
		@spoken_to = []
		@@all_speakers << name
		$connections[name.to_sym] = speakee
	end

	def self.append_speakee(name, speakee)
		$connections[name.to_sym] << speakee
	end

	#returns list of all speakers
	def self.list_speakers
		return @@all_speakers
	end

	#returns list of all connections hash for specific name
	def self.list_connections(name)
		return $connections[name.to_sym].flatten
	end	

	def self.connections
		return $connections
	end
	
end


# sally = Person.new("Sally")
# jon = Person.new("Jon")

# jon.speak_to(sally)

# jon.spoken_to