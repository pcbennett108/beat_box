require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list, :valid_beats
  def initialize
    @list = LinkedList.new
    @valid_beats = [
      "unce", "deep", "bop", "bap", 
      "tiss", "bomp", "na", "la", 
      "ifft", "doo", "ditt"
    ]
  end

  def validate_beats(beats)
    beats.split(' ').filter { |beat| valid_beats.include?(beat) }
  end

  def append(data)
    beat_list = validate_beats(data)
    beat_list.each { |beat| list.append(beat) }
  end

  def prepend(data)
    beat_list = validate_beats(data)
    beat_list.each { |beat| list.prepend(beat) }
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

# bb = BeatBox.new
# #bb.prepend("bomp bop bonk tiss")
# p bb.valid_beats

# p bb.prepend("bap deep bop zop bop sunday bla bla na")
# p bb.all
#bb.play
#require "pry" ; binding.pry