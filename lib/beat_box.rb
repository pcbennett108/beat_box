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

  #require "pry" ; binding.pry
end

