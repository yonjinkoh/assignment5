#this is to test symmetry. 



require 'Matrix'

our_matrix = Matrix[[0, 1, 1, 1, 0, 0], [1, 0, 1, 1, 0, 0], [1, 1, 0, 0, 1, 0], [0, 1, 0, 0, 1, 1], [0, 0, 1, 1, 0, 0], [0, 0, 0, 1, 0, 0]]
m_array = our_matrix.to_a

our_matrix.each_with_index do |e, row, col|
	# puts "#{e} at #{row}, #{col}"
	# puts our_matrix[col, row]

	unless e == our_matrix[col, row]
		if e == 0
			# puts row, col
			# puts our_matrix[col,row]
			m_array[col][row] = 0
		elsif e == 1
			m_array[row][col] = 0

		end
	end


end
	
new_matrix = Matrix.row(m_array)