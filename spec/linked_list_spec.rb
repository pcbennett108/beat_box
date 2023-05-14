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

# ===== Tests for Append, Count and To_string =====

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

  it 'outputs node data to a string' do
    list = LinkedList.new
    list.append("doop")

    expect(list.to_string).to eq("doop")
  end

  it 'outputs multi node data to a string' do
    list = LinkedList.new
    list.append("doop")
    list.append("blip")
    list.append("bop")
    list.append("zop")

    expect(list.to_string).to eq("doop blip bop zop")
  end

# ===== Tests for Insert and Prepend  =====

  it 'makes a new node the head' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")

    expect(list.to_string).to eq("dop plop suu")
  end

  it 'can insert a node' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    expect(list.to_string).to eq("dop woo plop suu")
  end

  it 'can find a node and return it' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(2, 1)).to eq("shi")
    expect(list.find(1, 3)).to eq("woo shi shu")
  end

  it 'check if node is included' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.includes?("deep")).to eq(true)
    expect(list.includes?("woo")).to eq(true)
    expect(list.includes?("dep")).to eq(false)
    expect(list.includes?("blop")).to eq(true)
  end

  it 'can pop nodes off the tail' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    list.pop
    list.pop

    expect(list.to_string).to eq("deep woo shi")
  end

  it 'can pop node with only a head' do
    list = LinkedList.new
    list.append("deep")

    list.pop

    expect(list.to_string).to eq("nil")
  end

end