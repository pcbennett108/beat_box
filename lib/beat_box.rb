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

  def all
    list.to_string
  end

  def play
    p "Playing: #{list.to_string}"
    `say -r 130 -v Rocko #{list.to_string}` 
  end

  
end

bb = BeatBox.new
bb.append("boop zop bonk boop")


p bb.count
#bb.play
#require "pry" ; binding.pry