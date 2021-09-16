## Object Security Coding Challenge
## Author: Danny Le
## Date: September 10, 2021
## Tree Helper
## Version: 1


module NTree

	##Challenge 1
	##Construct tree class
	##for tree initialization

	class Tree
		attr_accessor :root

		def initialize(node)
			self.root = node
		end

		def getRoot()
			return self.root
		end
	end

	##Challenge 1
	##Construct Node class
	##with all required attributes
	class Node
		#Create attributes for a given node
		attr_accessor :nodeId, :textB, :textD, :noOfChildren, :avgTextLen, :children, :parent, :totalTextLength
		#initialze node with attributes
		def initialize(nodeID,textB,textD)
			@nodeId = nodeID
			@textB = textB
			@textD = textD
			@children = []
			@noOfChildren = 0
			@avgTextLen = 0
			@parent = nil
			@totalTextLength = self.getText.length
		end

		#method to add child
		#to list of children of a node
		#set child's parent
		def addChild(child)
			@children << child
			child.parent = self
		end

		#count the number of children 
		#that belongs to a certain node
		def countChildren
			return self.children.length
		end

		#return the avg text length of all children
		#inclusive of current node
		#consider both textB and textD fields
		def getAvgLen
			return (self.totalTextLength/((self.noOfChildren + 1)*2.to_f)).truncate(3)
		end

		def getNoOfChildren
			return @noOfChildren
		end

		#get node's parent
		#return null if parent DNE
		def getParent
			return self.parent
		end

		#return an array of children
		def getChildren
			return self.children
		end

		#return the complete text attr
		#of given node
		def getText
			return self.textB + self.textD
		end

	end
end

#generate tree given node data
#loop through json
#and build tree structure
#starting with the root node
def genenerateTree(node,data)
	if !data.empty?
		if !data["children"].empty?
			node.noOfChildren = data["children"].length
			data["children"].each do |element|	
				currentNode = NTree::Node.new(element["nodeId"],element["textB"],element["textD"])
				node.addChild(currentNode)
				if element.has_key? "children"
					genenerateTree(currentNode,element)
				else
					break
				end
			end
		end
	else
		return
	end
end

# recursively traverse tree
# set the number of children for each node
# set the total length of text
# from descendants
def treeTraverse(node)
	if !node.children.empty?
		#traverse through each child recursively
		node.children.each do |child|
			if node.parent
				node.parent.noOfChildren += child.noOfChildren 
			else
				node.noOfChildren += 1
			end
			node.noOfChildren += child.noOfChildren
			node.totalTextLength += treeTraverse(child)
		end
	end
	#calculate the average length of 
	#each node's text value
	node.avgTextLen = node.getAvgLen
	return node.totalTextLength
end



#count the average text length
#of each node
def countTextLen(node)
	stringB = node.textB
	stringD = node.textD
	return stringB.length + stringD.length
end

##get the number of nodes in a given tree
##add to the total every time
##a child is encountered
def length(node)
	count = 0 if node.nil?
	count = 1 if node
	#puts "node's ID: " + node.nodeId.to_s
	#puts "node's total children: " + node.noOfChildren.to_s
	node.children.each do |child| 
		count += length(child)
	end
	return count
end

def bfs(tree)
	@outputString = ""
	@outputs = []
	#traverse tree and track traversal
	#order with a queue
	def traverse(node)
		#implement storage as queue
		#first element in is also 
		#first element out
		nodeQueue = []
		nodeQueue.push(node)
		while !nodeQueue.empty?
			#grab first element
			currentNode = nodeQueue.shift
			#if queue has children, then
			#process the children first
			if !currentNode.children.empty?
				currentNode.children.each do |child| 
					nodeQueue.push(child) 
				end
			end
			#store the node's nodeID in output
			@outputs.push(currentNode.nodeId)
			@outputString += currentNode.textB
		end
	end
	traverse(tree.getRoot)
	puts @outputString
	return @outputs
end



#depth-first search(DFS)
#Recursively traverse the tree
#visit children of the leftmost nodes
#first before traversing to the right
def dfs(tree)
	@outputs = []
	@stringOutput = ""
	#traverse tree using recursion
	def traverse(node)
		if node
			#store visited node's ID
			#into output array
			@outputs << node.nodeId
			#concatenate textD values
			#to temp string
			@stringOutput << node.textD
			node.children.each {|child| traverse(child)}
		end
	end
	traverse(tree.getRoot)
	puts @stringOutput
	return @outputs
end







