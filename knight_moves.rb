
class Node

	attr_accessor :position, :parent, :valid_mv

	def initialize(position, parent = nil)
		@position = position
		@parent = parent
		@moves =
			 [
				[2, 1], 
				[2, -1], 
				[1, 2], 
				[1, -2], 
				[-1, 2], 
				[-1, -2], 
				[-2, 1], 
				[-2, -1]
			]
	end

	def valid_mv

		valid = []

		@moves.each do |a, b|
			x, y = @position[0], @position[1]
			x += a
			y += b
			new_pos = [x, y]

			if onboard?(new_pos) && !self.parent.nil?
				then valid << new_pos unless new_pos == self.parent.position

			elsif onboard?(new_pos) 
				then valid << new_pos

			end
		end
		valid = valid.uniq
		valid
	end

	def onboard?(arr)
		(1 <= arr[0] && arr[0] <= 8) && (1 <= arr[1] && arr[1] <= 8)
	end

end

class Game

	attr_accessor :root

	def initialize(start, finish)
		@root = Node.new(start)
		@finish = finish
	end

	def knight_moves

		queue = [@root]

		until queue.empty? do

			current = queue.shift
		 return calculate_path(current) if current.position == @finish

			current.valid_mv.each do |n|

				node = Node.new(n, current)

				queue << node
			end
		end
	end

	def calculate_path(node)
		path = []
		until node == @root do
			path.unshift(node.position)
			node = node.parent
		end
		path.unshift(@root.position)
		print "Path: #{path}"
	end


end

 g = Game.new([1, 1], [7, 6])

 g.knight_moves

# get all valid moves
# if valid == end then return

# add each valid to queue
# for each valid
	# check all new valid moves
	# add each to queue