require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(data)
    beat_list = data.split(' ')
    beat_list.each { |beat| list.append(beat) }
  end

  def count
    list.count
  end

  def play
    p "Playing: #{list.to_string}"
    `say -r 130 -v Rocko #{list.to_string}` 
  end

  #require "pry" ; binding.pry
end

# bb = BeatBox.new
# bb.append("boop boop boop boop")
# bb.play
# bb.append("ooonce pit oonce pit oonce pit oonce pit")
# bb.play
# bb.list.pop
# bb.list.pop
# bb.list.pop
# bb.list.pop
# bb.play

# p bb.count
# bb.play