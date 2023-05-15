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
    bb.append("woo hoo shu")

    expect(bb.count).to eq(6)
  end

  it 'extra spaces dont affect combined appends' do
    bb = BeatBox.new
    bb.append("  deep doo  ditt")
    bb.append("woo hoo shu ")
    bb.append("zip   ")

    expect(bb.count).to eq(7)
  end

end