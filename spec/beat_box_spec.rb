require "./lib/beat_box"
require './lib/node'
require './lib/linked_list'

RSpec.describe BeatBox do
  it 'exists' do
    bb = BeatBox.new

    expect(bb).to be_instance_of(BeatBox)
  end

  xit 'has data' do
    bb = BeatBox.new

    expect(node.data).to eq("plop")
  end

  xit 'has a nil next node' do
    bb = BeatBox.new
    expect(node.next_node).to eq(nil)
  end

end