class Node

  attr_accessor :value, :parent, :children, :distance

  def initialize(value, parent = nil, children = [], distance = nil)
  	@value = value
  	@parent = parent
  	@children = children
  	@distance = distance
  end

end

class Knight

  attr_accessor :board

  def create_board
  	@board = []
    x_axis = (0..7).to_a
    y_axis = (0..7).to_a
    x_axis.each do |x|
      y_axis.each do |y|
        @board << [x, y]
      end
    end
    @board
  end

  def knight_moves(start_box, target_box)
  	@move = [[1, 2], [2, 1], [-1, 2], [-1, -2], [1, -2], [-2, 1], [-2, -1], [2, -1]]
  	return "You are here!" if start_box == target_box
  	start = Node.new(start_box)
  	target = Node.new(target_box)
  	path = [start_box]
  	@visited = [target]
  	@visited_values = [target_box]
  	queue = [target]
  	dis = 0
  	while !queue.empty?
  	  element = queue.shift
  	  @move.each do |move|
  	  	val = [element.value[0]+move[0], element.value[1]+move[1]]
  	  	count = dis + 1
  	  	node = Node.new(val, element, nil, count.to_i)
  	  	if val[0]<8 && val[1]<8 && val[0]>-1 && val[1]>-1 && !@visited.include?(node) && !@visited_values.include?(val)
  	      element.children = node
  	      queue << node
  	      @visited << node
  	      @visited_values << val
  	      return if val == start_box
  	    end
  	  end
  	  dis += 1
  	end
  
  end

  def visited_values
  	print @visited_values
  end

end

kn = Knight.new
kn.create_board
kn.knight_moves([0, 0], [1, 5])
puts kn.visited_values
