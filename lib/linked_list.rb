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

  def count
    if (head == nil)
      node_count = 0
    else
      last_node = head
      node_count = 1
      while (last_node.next_node != nil)
        last_node = last_node.next_node
        node_count += 1
      end
      node_count
    end
  end

end

#p list = LinkedList.new
#list.append("doop")
#list.append("bop")
#list.append("bing")

#p list.count