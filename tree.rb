## Object Security Coding Challenge
## Author: Danny Le
## Date: September 10, 2021
## Tree Helper
## Version: 1


module NTree

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
			@totalTextLength = 0
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

		#get all children and
		#children of children
		def noOfChildren
			#subtract 1 from the number of descendants
			@noOfChildren = length(self) - 1
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
def genenerateTree(node,data)
	if !data.empty?
		if !data["children"].empty?
			data["children"].each do |element|	
				currentNode = NTree::Node.new(element["nodeId"],element["textB"],element["textD"])
				node.addChild(currentNode)
				if element.has_key? "children"
					genenerateTree(currentNode,element)
				else
					break
				end
			end
		else
			
		end
	else
		return
	end
end

#recursively traverse tree
#return the total # of nodes
#under such tree
def treeTraverse(node,totalString="")
	count = 0
	totalTextLength = 0
	if node
		count = 1
		node.noOfChildren
		totalString
		totalTextLength += node.getText.length
		totalString << node.getText
		if !node.children.empty?
			#calculate average textLength
			#saved as float
			node.children.each {|e| totalTextLength += e.getText.length}
			#average text length = total length/#of nodes
			#including parent node
			node.avgTextLen = (totalTextLength /((node.children.length + 1) * 2).to_f).truncate(2)
			#count the number of descendants
			#including children of children
			node.children.each do |child| 
				count += treeTraverse(child,totalString)
			end
		else
			node.avgTextLen = (totalTextLength /((node.children.length + 1) * 2).to_f)
			return count
		end
	else
		return count
	end

	return count
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
	node.children.each do |child| 
		count += length(child)
	end
	return count
end

#depth-first search(DFS)
#Recursively traverse the tree
#visit children of the leftmost nodes
#first before traversing to the right
def dfs(node,outputs=[],stringOutput="")
	#return an emmpty list if 
	#root is null
	return [] if node.nil?
	#store visited node's ID
	#into output array
	outputs << node.nodeId
	#concatenate textD values
	#to temp string
	stringOutput << node.textD
	node.children.each {|child| dfs(child,outputs,stringOutput)}
end


#breadth-first search
#visit root node first then children
def bfs(node)
	outputString = ""
	#implement storage as queue
	#first element in is also 
	#first element out
	nodeQueue = []
	outputs = []
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
		outputs.push(currentNode.nodeId)
		outputString += currentNode.textB
	end

	return outputs,outputString
end





