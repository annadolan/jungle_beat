require_relative "node"

class LinkedList
  attr_accessor :head, :node, :data

  def initialize(data = nil)
    @head = Node.new(data)
  end

  #adds a node with given data to beginning of list,
  #moves the rest of the list down
  def prepend(data)
    node = Node.new(data)
    node.next_node = @head
    @head = node
  end

  #adds a node with given data to end of list
  def append(data)
    if @head.data.nil?
      @head = Node.new(data)
    else
      node = @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(data)
    end
  end

  #inserts a node with given data to the given numeric
  #location starting at 0
  def insert(loc, data)
    if @head.data == nil
      @head = Node.new(data)
    else
      counter = 1
      node = @head
      until counter == loc
        node = node.next_node
        counter += 1
      end
      new_node = Node.new(data)
      new_node.next_node = node.next_node
      node.next_node = new_node
    end
  end

  #returns the number of nodes currently in the list
  def count
    if @head.data == nil
      node_count = 0
    else
      node_count = 0
      node = @head
      until node.nil?
        node = node.next_node
        node_count += 1
      end
    end
    node_count
  end

  #returns the list as a string containing each
  #node's data
  def to_string
    node = @head
    string = ""
    until node.nil?
      string << "#{node.data} "
      node = node.next_node
    end
    string.strip
  end

  #finds nodes when given starting location and
  #number of nodes desired
  def find(loc, num)
    node = @head
  loc.times do node = node.next_node
      if node == nil
        return nil
      end
    end

    num_count = 1
    find_string = "#{node.data} "
    until num_count == num
      find_string << "#{node.next_node.data} "
      num_count +=1
      node = node.next_node
    end
    find_string.strip
  end

  #checks for whether the list includes a node
  #with the given data
  def includes?(data)
    node = @head
    include_array = []
    until node.nil?
      include_array << node.data
      node = node.next_node
    end
    include_array.include?(data)
  end

  #removes last node in list, return's the removed
  #node's value
  def pop
      node = @head
      if node.data == nil
        remove = ""
      else
        node = node.next_node until node.next_node.next_node.nil?
        remove = node.next_node.data
        node.next_node = nil
      end
      remove
  end

  #defines a list of allowed words that can be
  #appended, prepended, or inserted, and checks
  #data input for whether it is allowed
  def allowed(data) #Extension 1
    allow = ["tee", "dee", "deep", "bop", "boop", "la",
        "na", "doop", "dop", "plop", "suu", "woo", "shi",
        "shu", "blop", "ditt", "hoo", "doo", "poo"]
    if allow.include?(data)
      allowed = true
    else
      allowed = false
    end
  end
end
