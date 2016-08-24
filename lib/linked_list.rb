require_relative "node"

class LinkedList
  attr_accessor :head, :node, :data

  def initialize(data = nil)
    @head = Node.new(data)


  end

  def prepend(data)

    node = Node.new(data)
    node.next_node = @head
    @head = node


  end

  def append(data)

    if @head.data.nil?
      @head = Node.new(data)
    else
      node = @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(data)

    end
  end

  def insert(loc, data)
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

  def to_string
    node = @head
    string = ""
    until node.nil?
      string << "#{node.data} "
      node = node.next_node

    end
    string.to_s.strip
  end

  def find(loc, num)
    loc_counter = 0
    node = @head
    until loc_counter == loc
      node = node.next_node
      loc_counter += 1
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

  def includes?(data)
    node = @head
    include_array = []
    until node.nil?
      include_array << node.data
      node = node.next_node
    end
    include_array.include?(data)
  end

  def pop
      node = @head
      if node.data == nil
        remove = nil
      else
        until node.next_node.next_node.nil?
        node = node.next_node
        end
        remove = node.next_node.data
        node.next_node = nil
      end

      remove
  end

  def allowed(data) #Extension 1
    allow = ["tee", "dee", "deep", "bop", "boop", "la",
        "na", "doop", "dop", "plop", "suu", "woo", "shi",
        "shu", "blop", "ditt", "hoo", "doo"]
    if allow.include?(data)
      allowed = true
    else
      allowed = false
    end
  end
end
