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
      current_node = head
      while (current_node.next_node != nil)
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def count
    if (head == nil)
      node_count = 0
    else
      current_node = head
      node_count = 0
      while (current_node != nil)
        current_node = current_node.next_node
        node_count += 1
      end
      node_count
    end
  end

  def to_string
    if (head == nil)
      return
    else
      output = []
      current_node = head
      while (current_node != nil)
        output << current_node.data
        current_node = current_node.next_node
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

  def find(position, number_of_beats)
    if (head == nil)
      return
    elsif (position >= self.count) ||
          (self.count - position < number_of_beats)
      return
    else
      output = []
      current_node = head
      node_count = 0
      while (node_count < position)
        current_node = current_node.next_node
        node_count += 1
      end
      number_of_beats.times do 
      output << current_node.data
      current_node = current_node.next_node
      end
    end
    output.join(' ')
  end

  def includes?(beat)
    if (head == nil)
      return false
    end
    current_node = head
    has_beat = false
    while (current_node != nil)
      if (current_node.data == beat)
        has_beat = true
      end
      current_node = current_node.next_node
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
