#accepts order matrix and list of speakers
#returns array with row with speakees
#ordered by column of speakers
require 'Matrix'
#Test symmetric array
m = Matrix[[1,0,1],[0,1,0],[1,0,0]]

#changes to array to sort it through
m = m.to_a()

#Test Name list names is array of names
names = ["Andrew","Colin","Matt"]

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
	i += 1
end 

puts order_list.inspect