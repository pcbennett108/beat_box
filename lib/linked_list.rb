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

  def to_string
    if (head == nil)
      puts "Nothing to see here." #? use p or print instead?
    else
      output = ""
      last_node = head
      output += last_node.data
      while (last_node.next_node != nil)
        last_node = last_node.next_node
        output << " " + last_node.data
      end
      output
    end
  end

  def prepend(data)
    if (head == nil)
      @head = Node.new(data)
    else
      old_head = head
      @head = Node.new(data)
      head.next_node = old_head
    end
  end

end

#require "pry" ; binding.pry
#p list = LinkedList.new
#list.append("doop")
#list.append("bop")
#list.append("bing")

#p list.count