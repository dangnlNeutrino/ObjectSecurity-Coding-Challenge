## Object Security Coding Challenge
## Author: Danny Le
## Date: September 10, 2021
## JSON Helper
## Version: 1

require 'json'

def readJSON(input)

	dataHash = nil
	begin
		path = File.expand_path('../' + input, __FILE__)
		file = File.read(path)
	rescue Errno::ENOENT => e
		puts "File or directory #{input} does not exist."
	rescue Errno::EACCES => e
		puts "Cannot access #{input}. Invalid permissions."
	else
		dataHash = JSON.parse(file)
	end
	return dataHash
end