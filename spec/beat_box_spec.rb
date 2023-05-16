require "./lib/beat_box"
require './lib/node'
require './lib/linked_list'

RSpec.describe BeatBox do
  it 'exists' do
    bb = BeatBox.new

    expect(bb).to be_instance_of(BeatBox)
  end

  it 'can append multiple beats at once' do
    bb = BeatBox.new
    bb.append("deep doo ditt")

    expect(bb.list.head.data).to eq("deep")
    expect(bb.list.head.next_node.data).to eq("doo")
  end

  it 'combined appends create seperate beats' do
    bb = BeatBox.new
    bb.append("deep doo ditt")
    bb.append("ifft unce doo")

    expect(bb.count).to eq(6)
  end

  it 'can prepend multiple beats at once' do
    bb = BeatBox.new
    bb.prepend("deep bop ditt")

    expect(bb.list.head.data).to eq("ditt")
    expect(bb.list.head.next_node.data).to eq("bop")
  end

  it 'combined prepends create seperate beats' do
    bb = BeatBox.new
    bb.append("deep doo ditt")
    bb.prepend("unce tiss bomp")

    expect(bb.count).to eq(6)
  end

  it 'extra spaces dont affect combined appends' do
    bb = BeatBox.new
    bb.append("  deep doo  ditt")
    bb.append("bomp na la ")
    bb.append("bap   ")

    expect(bb.count).to eq(7)
  end

  it 'prints list with method called all' do
    bb = BeatBox.new
    bb.append("deep doo ditt")
    bb.append("bomp na la")

    expect(bb.all).to eq("deep doo ditt bomp na la")
  end

  it 'validates list on append' do
    bb = BeatBox.new
    bb.append("deep doop dift")
    bb.append("na na blurst cromulent tiss unce zop")

    expect(bb.all).to eq("deep na na tiss unce")
  end

  it 'validates list on prepend' do
    bb = BeatBox.new
    bb.prepend("deep doop dift")
    bb.prepend("na na blurst cromulent tiss unce zop")

    expect(bb.all).to eq("unce tiss na na deep")
  end

  it 'can play a default beat' do
    bb = BeatBox.new
    bb.append("deep doo ditt")
    bb.prepend("ifft unce doo")

    expect(bb.play).to eq(6)
    expect(bb.all).to eq("doo unce ifft deep doo ditt")
    expect(bb.rate).to eq(500)
    expect(bb.voice).to eq("Boing")
  end

  it 'can play a custom beat' do
    bb = BeatBox.new
    bb.append("deep doo ditt")
    bb.prepend("ifft unce doo")
    bb.rate = 140
    bb.voice = "Daniel"

    expect(bb.all).to eq("doo unce ifft deep doo ditt")
    expect(bb.rate).to eq(140)
    expect(bb.voice).to eq("Daniel")
    expect(bb.play).to eq(6)
  end

  it 'can play a default beat' do
    bb = BeatBox.new
    bb.append("bomp pish bomp pish bomp pish")
    bb.reset_rate
    bb.reset_voice

    expect(bb.play).to eq(6)
    expect(bb.all).to eq("bomp pish bomp pish bomp pish")
    expect(bb.rate).to eq(500)
    expect(bb.voice).to eq("Boing")
  end

end