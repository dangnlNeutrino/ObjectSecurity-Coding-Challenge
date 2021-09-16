## Object Security Coding Challenge
## Author: Danny Le
## Date: September 10, 2021
## Main class
## Version: 1

require_relative 'tree.rb'
require_relative 'jsonHelper.rb'

include NTree

@rootNode = nil
@tree = nil
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
		@tree = NTree::Tree.new(@rootNode)
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
	count = treeTraverse(@rootNode)
	puts "Set noOfChildren and avgTextLen for each node!"
	puts "Root node # of children: " + @rootNode.noOfChildren.to_s
	puts "Root node average text length: " + @rootNode.getAvgLen.to_s
	puts "-----------------------------------"
end



##Challenge #4
##calculate the number of 
##nodes in the tree
def challenge4
	@size = length(@rootNode)
	puts "Challenge #4 solution: "
	puts "Number of nodes in tree: " + @size.to_s
	puts "-----------------------------------"
end

#Calculate average length of text values
# (total number of characters)/(number of nodes * 2)
#where 2 represents textB and textD fields
def challenge5
	puts "Challenge #5 solution: "
	##@tree.getRoot is @rootNode
	puts "Average length of text values: " + (@tree.getRoot.totalTextLength / (@size*2).to_f).truncate(2).to_s
	puts "-----------------------------------"
end

##Challenge #6
##BFS
def challenge6()
	#tree,textB = bfs(@rootNode)
	puts "Challenge #6 solution: "
	p bfs(@tree)
	puts "-----------------------------------"
end

##Challenge #7
##DFS
def challenge7()
	puts "Challenge #7 solution: "
	p dfs(@tree)
	puts "-----------------------------------"
end



challenge2()
challenge3()
challenge4()
challenge5()
challenge6()
challenge7()

#p treeTraverse(@rootNode)
puts @rootNode.getAvgLen.to_s
#@tree = NTree::Tree.new(@rootNode)
#p @tree.getRoot
#p bfs(@tree)
#p dfs(@tree)




