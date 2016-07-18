class Node

  attr_accessor :value, :parent

  def initialize(value, parent)
  	@value = value
  	@parent = parent
  end

end

class Knight

  def knight_moves(start_box, target_box)
  	@start = start_box
  	@target = target_box
  	@move = [[1, 2], [2, 1], [-1, 2], [-1, -2], [1, -2], [-2, 1], [-2, -1], [2, -1]]
  	target = Node.new(target_box, nil)
  	@visited = [target]
  	@visited_values = [target_box]
  	@last = nil
  	queue = [target]
  	until queue.empty?
  	  element = queue.shift
  	  @move.each do |move|
  	  	val = [element.value[0]+move[0], element.value[1]+move[1]]
  	  	node = Node.new(val, element)
  	  	if val[0]<8 && val[1]<8 && val[0]>-1 && val[1]>-1 && !@visited.include?(node) && !@visited_values.include?(val)
  	      queue << node
  	      @visited << node
  	      @visited_values << val
  	      @last = node
  	      return if val == start_box
  	    end
  	  end
  	end
  
  end

  def visited_values
  	puts "The moves from #{@start} to #{@target} were: "
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
kn.knight_moves([0, 0], [7, 7])
puts kn.visited_values
