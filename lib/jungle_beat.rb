require "../lib/node"
require "../lib/linked_list"

class JungleBeat
  attr_accessor :list, :rate, :voice
  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

  #appends one or multiple nodes in order given, if allowed
  def append(data)
    append_array = data.split
    append_array.each do |item|
      if list.allowed(item)
        @list.append(item)
      else
        0
      end
    end
  end

  #prepends one or multiple nodes in order given, if allowed
  def prepend(data)
    prepend_array = data.split.reverse
    prepend_array.each do |item|
      if list.allowed(item)
        @list.prepend(item)
      else
        0
      end
    end
  end

  def count
    list.count
  end

  #returns the list as a string containing each
  #node's data
  def to_string
    list.to_string
  end

  #finds one or multiple nodes when given
  #starting location and number of nodes desired
  def find(loc, data)
    list.find(loc, data)
  end

  #inserts one or multiple nodes (in order given) when
  #given starting location and data, if allowed
  def insert(loc, data)
    insert_array = data.split.reverse
    insert_array.each do |item|
      if list.allowed(item)
        @list.insert(loc, item)
      else
        0
      end
    end
  end

  #checks whether given data is in any of the nodes
  #in the list
  def includes?(data)
    list.includes?(data)
  end

  #removed the last node from the list
  def pop
    list.pop
  end

  #tells the computer to read the data in each node
  def play
    beats = list.to_string
    `say -r #{rate} -v #{voice} #{beats}`
  end

  #resets the rate to its starting value
  def reset_rate
    @rate = 500
  end

  #resets the voice to its starting value
  def reset_voice
    @voice = "Boing"
  end
end
