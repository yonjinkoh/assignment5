require 'Matrix'

#test code
names = ["A","B", "C","D"]
matrix = Matrix[[0,1,0,0],[1,0,1,1],[0,1,0,1],[0,1,1,0]]

#power of the matrix we want
n = 5

p = 1
master_connections_array = []

while p < (n) do 
	matrix = matrix ** p
	m = matrix.to_a()

	#matrix_to_connections_block

		size = m.length
		i = 0

		#Gathers the name of connects for a given
		#order matrix
		order_list = []
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
			order_list << speaker 
			#puts order_list.inspect 
			i += 1
		end 

	#matrix_to_connections_block end

	puts "p is #{p}"
	#removes repeats from order list for p>1
	if p > 1
		order_list_size = order_list.length
		# puts order_list_size
		l = 0
		while l < order_list_size do
			if order_list[l] != nil
			# puts order_list[l].inspect
			# puts l
			# puts master_connections_array[p-2].inspect
			order_list[l] = order_list[l]-master_connections_array[p-2][l]
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

puts master_connections_array.inspect