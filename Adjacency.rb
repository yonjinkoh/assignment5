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

			if @speakers.index(name) != nil
			indexarray << @speakers.index(name)
			end

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
				if x != 0
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

	#input symmetric adjacency matrix
	def order_matrix_name(sym)
		name = @speakers
		matrix = sym

		#power of the matrix we want
		n = name.length
		p = 1
		master_connections_array = []

		while p < (n) do 		
			matrix = matrix ** p

			if p > 4
			#normalization number
			puts matrix.to_a().class
			to_normalize = matrix.to_a()
				to_normalize.each_with_index do |x, indexA|
					x.each_with_index do |y, indexB|
						if y != 0
							to_normalize[indexA][indexB] = 1
						end
					end
				end
			
			matrix = Matrix.rows(to_normalize)

			end

			puts matrix.trace


			order_list = matrix_to_connections(matrix)

			#removes repeats from order list for p>1
			if p > 1
				order_list_size = order_list.length
				# puts order_list_size
				l = 0
				while l < order_list_size do
					if order_list[l] != nil
		
					#removes previously occurred link from new links			
					m = p
					while m > 0 do
					order_list[l] = order_list[l]-master_connections_array[m-2][l]
					m -= 1
					end
					
					end
					l += 1
				end
				# puts master_connections_array[p-1].inspect
				# puts order_list.inspect
			end

			#add list to master connection array
			master_connections_array << order_list
			# puts master_connections_array.inspect
			p += 1
		end



		return master_connections_array.insert(0, name)

	end

		def print_output(a)
		File.open('complex_output.txt', 'w') do |f1|
			all_speakers = a[0]
			a_length = a.length
			all_speakers.each_with_index do |speaker, index| 
				a.each_with_index do |e,x|
					if e[index].class == Array
						if e[index].join(", ").length != 0
							f1.puts e[index].join(", ")
						end
					elsif e[index].class == String
						if e[index].length != 0
							f1.puts e[index]
						end
					end
				end
				f1.puts "\n"
			end
		end
	end
end