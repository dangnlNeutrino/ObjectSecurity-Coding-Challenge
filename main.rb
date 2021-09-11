## Object Security Coding Challenge
## Author: Danny Le
## Date: September 10, 2021
## Main class
## Version: 1

require_relative 'tree.rb'
require_relative 'jsonHelper.rb'

include NTree

@rootNode = nil
#step 1
#Read in JSON data and store as hash
def challenge2()
	data = {}
	data = readJSON('data.json')
	puts "-----------------------------------"
	puts "Challenge #1 and #2 solution: "
	#step 2
	#initialize tree from JSON dataset
	if !data.empty?
		#traverse through the dataset
		#and construct N-ary tree
		#first node is always the root node
		puts "Data loaded successfully!!"
		@rootNode = NTree::Node.new(data["nodeId"],data["textB"],data["textD"])
		genenerateTree(@rootNode,data)
		puts "Tree constructed successfully!!"
	else
		puts "Empty dataset!"
	end
	puts "-----------------------------------"
end

#traverse the tree and output
#all nodes' IDs	
def challenge3
	puts "Challenge #3 solution: "
	@totalString = ""
	count = 0 
	count = treeTraverse(@rootNode,@totalString)
	puts "Root node # of children: " + @rootNode.noOfChildren.to_s
	puts "Root node average text length: " + @rootNode.avgTextLen.to_s
	puts "-----------------------------------"
end



##Challenge #4
##calculate the number of 
##nodes in the tree
def challenge4
	size = length(@rootNode)
	puts "Challenge #4 solution: "
	puts "Number of nodes in tree: " + size.to_s
	puts "-----------------------------------"
	puts "Challenge #5 solution: "
	puts "Average length of text values: " + (@totalString.length / size.to_f).truncate(2).to_s
	puts "-----------------------------------"
end

##Challenge #6
##BFS
def challenge6()
	tree,textB = bfs(@rootNode)
	puts "Challenge #6 solution: "
	puts "BFS result: " + tree.join(" ")
	puts "BFS textB output: " + textB
	puts "-----------------------------------"
end

##Challenge #7
##DFS
def challenge7()
	output = []
	s = ""
	dfs(@rootNode,output,s)
	puts "Challenge #7 solution: "
	p "DFS output: " + output.join(" ")
	puts s
	puts "-----------------------------------"
end



challenge2()
challenge3()
challenge4()
challenge6()
challenge7()





