class Adjacency

	def initialize(hash)
		#gets speakers and converts to strings
		@speakers = hash.keys.map{|x| x.to_s}
		@hash = hash
	end

	#Create row of 1 and 0 for adjacency matrix
	def row(this_speaker)
		indexarray = []
		speakees = @hash[this_speaker.to_sym].flatten
		speakees.each do |name|
			indexarray << @speakers.index(name)
		end
		puts indexarray.inspect
		#Create row of length @speakers
		matrixrow = Array.new(@speakers.length, 0)
		indexarray.each do |i|
			matrixrow[i] = 1
		end
		return matrixrow
	end

	#Produce Matrix from rows
	def make_matrix
		matrix = []
		@speakers.each do |this_speaker|
			matrix << row(this_speaker)
		end
		return matrix
	end

end