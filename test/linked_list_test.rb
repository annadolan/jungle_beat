require "../lib/linked_list"
require "minitest/autorun"
require "minitest/pride"

class LinkedListTest < Minitest::Test
    def test_head_nil
    list = LinkedList.new

    assert_equal nil, list.head.data
  end

  def test_append_one_node
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.head.data
  end

  def test_append_two_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal "doop", list.head.data
    assert_equal "deep", list.head.next_node.data
  end

  def test_next_node_nil
    list = LinkedList.new
    list.append("doop")

    assert_equal nil, list.head.next_node
  end

  def test_count
    list = LinkedList.new

    assert_equal 0, list.count

    list.append("doop")

    assert_equal 1, list.count

    list.append("deep")

    assert_equal 2, list.count

    list.append("bop")

    assert_equal 3, list.count
  end

  def test_list_to_string
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string

    list.append("deep")

    assert_equal "doop deep", list.to_string

  end

  def test_prepend_to_list
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    node = list.head

    assert_equal "dop", node.data
    assert_equal "plop", node.next_node.data
    assert_equal "suu", node.next_node.next_node.data

    list.prepend("bop")
    node = list.head

    assert_equal "bop", node.data
    assert_equal "dop", node.next_node.data
    assert_equal "plop", node.next_node.next_node.data
    assert_equal "suu", node.next_node.next_node.next_node.data

  end

  def test_insert_to_location
    list = LinkedList.new
    list.insert(0, "plop")
    list.append("suu")
    list.prepend("dop")

    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string

    list.insert(3, "poo")

    assert_equal "dop woo plop poo suu", list.to_string
  end

  def test_find_by_location_and_number
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "shi", list.find(2, 1)
    assert_equal "woo shi shu", list.find(1, 3)
    assert_equal "shu blop", list.find(3, 2)
  end

  def test_check_for_include
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string

    assert list.includes?("deep")
    refute list.includes?("dep")
  end

  def test_pop_last_node
    list = LinkedList.new
    assert_equal nil, list.pop
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "blop", list.pop
    assert_equal "deep woo shi shu", list.to_string
    assert_equal "shu", list.pop
    assert_equal "deep woo shi", list.to_string
    assert_equal "shi", list.pop
    assert_equal "deep woo", list.to_string
  end
end
