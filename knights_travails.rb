class Node

  attr_accessor :value, :distance, :parent, :children

  def initialize(value, distance, parent, children)
  	@value = value
  	@distance = distance
  	@parent = parent
  	@children = children
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
  	@start_box = start_box
  	@target_box = target_box
  	@move = [[1, 2], [2, 1], [-1, 2], [-1, -2], [1, -2], [-2, 1], [-2, -1], [2, -1]]
  	start = Node.new(@start_box, nil, nil, nil)
  	target = Node.new(target_box, 0, nil, nil)
  	path = [@start_box]
  	@visited = [target]
  	@visited_values = [target_box]
  	@last = nil
  	queue = [target]
  	dis = 0
  	until queue.empty?
  	  element = queue.shift
  	  @move.each do |move|
  	  	val = [element.value[0]+move[0], element.value[1]+move[1]]
  	  	count = dis
  	  	node = Node.new(val, count, element, nil)
  	  	if val[0]<8 && val[1]<8 && val[0]>-1 && val[1]>-1 && !@visited.include?(node) && !@visited_values.include?(val)
  	      element.children = node
  	      queue << node
  	      @visited.unshift node
  	      @visited_values.unshift val
  	      @last = node
  	      return if val == start_box
  	    end
  	  end
  	  dis += 1
  	end
  
  end

  def visited_values
  	p @last.value
  	node = @last
  	while node.parent
  	  previous = node.parent
  	  p previous.value
  	  node = previous
  	end
  	
  end

end

kn = Knight.new
kn.create_board
kn.knight_moves([0, 0], [3,5])
puts kn.visited_values
