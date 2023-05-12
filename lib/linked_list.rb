require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if (head == nil)
      @head = Node.new(data)
    else
      last_node = head
      while (last_node.next_node != nil)
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(data)
    end
  end

  # def count
    
  # end

end

p list = LinkedList.new
list.append("doop")
p list.append("bop")
p list.append("bing")

p list