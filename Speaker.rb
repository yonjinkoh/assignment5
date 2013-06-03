class Speaker
attr_reader :spoken_to,:name
@@all_speakers = []

	def initialize(name)
		@name = name.to_sym
		@spoken_to = []
		@@all_speakers << name.to_sym
	end

	def list_speakers
		return @@all_speakers
	end

	def include?(name)
		return list_speakers.include?(name.to_sym)
	end	
		
end


# sally = Person.new("Sally")
# jon = Person.new("Jon")

# jon.speak_to(sally)

# jon.spoken_to