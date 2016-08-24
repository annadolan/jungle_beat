require "../lib/node"
require "../lib/linked_list"

class JungleBeat
  attr_accessor :list, :rate, :voice
  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end
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

  def to_string
    list.to_string
  end

  def find(loc, data)
    list.find(loc, data)
  end

  def insert(loc, data)
    list.insert(loc, data)
  end

  def includes?(data)
    list.includes?(data)
  end

  def pop
    list.pop
  end

  def play
    beats = list.to_string
    list.count
    `say -r #{rate} -v #{voice} #{beats}`
  end
  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

end
