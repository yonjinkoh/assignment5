class Adjacency
require 'Matrix'

	def initialize(hash)
		#gets speakers and converts to strings
		@speakers = hash.keys.map{|x| x.to_s}.sort!
		@hash = hash
	end

	#Create row of 1 and 0 for adjacency matrix
	def row(this_speaker)
		indexarray = []
		speakees = @hash[this_speaker.to_sym].flatten.sort!
		speakees.each do |name|
			indexarray << @speakers.index(name)
		end
		# puts indexarray.inspect
		#Create row of length @speakers
		matrixrow = Array.new(@speakers.length, 0)
		indexarray.each do |i|
			matrixrow[i] = 1
		end
		return matrixrow
	end

	#Produce Matrix from rows
	def make_matrixarray
		matrix = []
		@speakers.each do |this_speaker|
			matrix << row(this_speaker)
		end
		#return matrix array
		return matrix
	end

	#Produce a symmetric matrix
	def symmetrize(array)
		first_matrix = Matrix.rows(array)
		first_matrix.each_with_index do |e, row, col|
	# puts "#{e} at #{row}, #{col}"
	# puts our_matrix[col, row]

			unless e == first_matrix[col, row]
				if e == 0
					# puts row, col
					# puts our_matrix[col,row]
					array[col][row] = 0
				elsif e == 1
					array[row][col] = 0
				end
			end
		end
		second_matrix = Matrix.rows(array)
		return second_matrix
	end

	#accepts order matrix and list of speakers
	#returns array with row with speakees
	#ordered by column of speakers
	def matrix_to_connections(matrix)
		#get a list of speakers
		names = @speakers	
		#convert order matrix to array
		m = matrix.to_a()
		size = m.length
		i = 0

		order_array = []
		while i < size do
			speaker = []
			#Search through each row
			m[i].each_with_index do |x,index|
				if x == 1
					#check not in diagonal
					if index != i
					speaker << names[index]
					end
				else
					#Do nothing not connected
				end	
			end


			#Returns links with associated name
			order_array << speaker  
			i += 1
		end 

		return order_array
	end



end