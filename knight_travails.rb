class Knight
	attr_accessor :board, :tree

	def initialize()
		@board = create_board
	end

	def create_board
		counter = 0
		@board = [[],[]]
		letters = ["a","b","c","d","e","f","g","h"]
		
		#letters.each do |letter|
		8.times do |num1|
			8.times do |num|
				@board[counter] = [num1+1,num+1]
				counter += 1
			end
		end
		
		@board
	end


	def build_tree
		@tree = Tree.new()
 		one = 1
 		two = 2
		@board.each do |element|
			children = []
			
			8.times do |num|
				arr = []
				case num
					when 0
						arr[0] = element[0] + two 
						arr[1] = element[1] + one
						children.push(arr) if @board.include?(arr)
					when 1
						arr[0] = element[0] + two 
						arr[1] = element[1] - one
						children.push(arr) if @board.include?(arr)
					when 2
						arr[0] = element[0] - two 
						arr[1] = element[1] + one
						children.push(arr) if @board.include?(arr)
					when 3
						arr[0] = element[0] - two 
						arr[1] = element[1] - one
						children.push(arr) if @board.include?(arr)
					when 4
						arr[0] = element[0] + one 
						arr[1] = element[1] + two
						children.push(arr) if @board.include?(arr)
					when 5
						arr[0] = element[0] + one 
						arr[1] = element[1] - two
						children.push(arr) if @board.include?(arr)
					when 6
						arr[0] = element[0] - one 
						arr[1] = element[1] + two
						children.push(arr) if @board.include?(arr)
					when 7
						arr[0] = element[0] - one 
						arr[1] = element[1] - two
						children.push(arr) if @board.include?(arr)
				end
				
			end
			@tree.add_node(element, children)
		end


	end

	def the_path(start, finish)
		queue = [start]
		counter = 0
		visited = {}

		while !queue.empty?
			current = queue[0]
			visited[current] = @tree.nodes[current]
			queue.shift
			counter += 0
			if @tree.nodes[current].include?(finish)
				visited[current] = @tree.nodes[current]
				break
			else
				@tree.nodes[current].each do |element|
					queue.push(element)
				end
				
			end
			
		end
		
		p visited
		

		
	end

	def demonstrate_tree
		@tree.nodes.each do |key, val|
			#puts "Parent: #{key} | Kids: #{val}"
		end


	end

end

class Tree
	attr_accessor :nodes
	def initialize()
		@nodes = {}
	end

	def add_node(name, children)
		@nodes[name] = children
	end
end

game = Knight.new()
game.build_tree
#game.demonstrate_tree

arr1 = [1,1]
arr2 = [6,3]
game.the_path(arr1,arr2)


