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
    #? works when head is nil ?
    if (head == nil)
      return
    else
      output = []
      last_node = head
      output << last_node.data
      while (last_node.next_node != nil)
        last_node = last_node.next_node
        output << last_node.data
      end
      output.join(' ')
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

  def insert(position, data)
    if (head == nil)
      @head = Node.new(data)
    elsif (position > self.count)
      return
    elsif (position <= 0)
      old_head = head
      @head = Node.new(data)
      head.next_node = old_head
    else
      current_node = head
      node_count = 1
      while (node_count < position)
        current_node = current_node.next_node
        node_count += 1
      end
      new_node = Node.new(data)
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def find(position, amt)
    #todo = error ~undef method next_node for nil when finding position higher than length
    if (head == nil)
      return
    else
      output = []
      current_node = head
      node_count = 0
      while (node_count < position)
        current_node = current_node.next_node
        node_count += 1
      end
      amt.times do 
      output << current_node.data
      current_node = current_node.next_node
      end
    end
    output.join(' ')
  end

  def includes?(beat)
    if (head == nil)
      return
    end
    current_node = head
    has_beat = false
    has_beat = (current_node.data == beat)
    while (current_node.next_node != nil)
      if (current_node.data == beat)
        has_beat = true
      end
      current_node = current_node.next_node
    end
    if (current_node.data == beat)
      has_beat = true
    end
    has_beat
  end

  def pop
    #? pop returns nil when called
    current_node = head
    prev_node = nil
    if (head == nil)
      return
    elsif (head.next_node == nil)
      @head = nil
      return
    end

    while (current_node.next_node != nil)
      prev_node = current_node
      current_node = current_node.next_node
    end
    prev_node.next_node = nil
  end

end

list = LinkedList.new
  list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

#     list.pop
#     list.pop
#require "pry" ; binding.pry