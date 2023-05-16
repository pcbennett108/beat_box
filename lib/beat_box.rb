require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list, :valid_beats
  attr_accessor :rate, :voice
  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
    @valid_beats = [
      "unce", "deep", "bop", "bap", 
      "tiss", "bomp", "na", "la", 
      "ifft", "doo", "ditt", "pish"
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

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    p "Playing: #{list.to_string}"
    # I like to see what is being played
    `say -r #{rate} -v #{voice} #{list.to_string}`
    self.count 
    #Interaction guide shows length return on playback
  end

end

#* .........Available voices.............
#* Fred, Junior, Kathy, Nickey, Ralph, Samantha
#* Karen, Rishi, Moria, Tessa, Daniel
#* Albert, Bahh, Bells, Boing, Bubbles, Jester
#* Organ, Trinoids, Whisper, Wobble, Zarvox
#* Eddy, Flo, Reed, Rocko, Sandy, Shelley


# bb = BeatBox.new
# bb.append("bomp tiss bomp tiss bap bop bop bap ifft ifft ifft ifft")
#require "pry" ; binding.pry