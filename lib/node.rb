class Node
  attr_accessor :next_node
  attr_reader :data
  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end

end
#todo = make next_node & data handle a nil head