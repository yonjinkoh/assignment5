#Parses tweet lines
class Parser

	def initialize(text)
		@line = text
	end	

	def receiver
		receivers = @line.scan(/\@\w+/)
		return receivers.map!{ |element| element.gsub(/@/, '') }
	end

	def sender
		return @line[/\w+/]
	end

end