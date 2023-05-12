require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
  end

  it 'has an empty head' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end

  it 'can append a node' do
    list = LinkedList.new
    list.append("doop")

    expect(list.head.data).to eq("doop")
  end

  it 'appended node points to nil' do
    list = LinkedList.new
    list.append("doop")
    list.append("bop")

    expect(list.head.next_node.data).to eq("bop")
  end

  it 'can count its nodes' do
    list = LinkedList.new
    list.append("doop")

    expect(list.count).to eq(1)
  end

  it 'can count when empty' do
    list = LinkedList.new

    expect(list.count).to eq(0)
  end

  it 'can count longer lists' do
    list = LinkedList.new
    
    list.append("doop")
    list.append("blip")
    list.append("bop")
    list.append("zop")

    expect(list.count).to eq(4)
  end

  xit 'outputs node data to a string' do
    list = LinkedList.new
    list.append("doop")

    expect(list.to_string).to eq("doop")
  end

end