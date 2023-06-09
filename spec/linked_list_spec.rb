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

  it 'can insert a node to the end' do
    list = LinkedList.new
    list.append("bop")
    list.append("zap")
    list.append("pish")
    list.insert(3, "woo")

    expect(list.to_string).to eq("bop zap pish woo")
  end

  it 'can insert a node to the head' do
    list = LinkedList.new
    list.append("bop")
    list.append("zap")
    list.append("pish")
    list.insert(0, "woo")

    expect(list.to_string).to eq("woo bop zap pish")
  end

  it 'can handle insert with over-large position number' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.append("dop")
    list.insert(22, "waaat")

    expect(list.to_string).to eq("plop suu dop")
  end

# ===== Tests for Find, Includes and Pop  =====

  it 'can find a node and return it' do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(2, 1)).to eq("shi")
    expect(list.find(1, 3)).to eq("woo shi shu")
    expect(list.find(0, 5)).to eq("deep woo shi shu blop")
    expect(list.find(4, 1)).to eq("blop")
  end

  it 'can handle find with out-of-range arguments' do
    list = LinkedList.new
    list.append("bonk")
    list.append("blip")
    list.append("zip")
    list.append("biff")
    list.append("bap")

    expect(list.find(7, 1)).to eq(nil)
    expect(list.find(2, 13)).to eq(nil)
    expect(list.find(9, 23)).to eq(nil)
    expect(list.find(0, 6)).to eq(nil)
  end

  it 'checks if node is included' do
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

  it 'will call pop on empty head without error' do
    list = LinkedList.new
    list.append("deep")

    list.pop
    list.pop

    expect(list.count).to eq(0)
  end

  it 'can pop node with only a head' do
    list = LinkedList.new
    list.append("deep")

    list.pop

    expect(list.to_string).to eq(nil)
  end

end