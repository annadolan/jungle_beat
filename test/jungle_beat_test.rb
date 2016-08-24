require "../lib/jungle_beat"
require "minitest/autorun"
require "minitest/pride"

class JungleBeatTest < Minitest::Test

  def test_append_multiple_nodes
    jb = JungleBeat.new

    assert_equal nil, jb.list.head.data

    jb.append("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data

  end

  def test_prepend_multiple_nodes
    jb = JungleBeat.new

    assert_equal nil, jb.list.head.data

    jb.prepend("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
  end

  def test_jb_count
    jb = JungleBeat.new
    assert_equal 0, jb.count

    jb.append("deep doo ditt")

    assert_equal 3, jb.count
    jb.append("boop")

    assert_equal 4, jb.count
  end

  def test_jb_to_string
    jb = JungleBeat.new
    jb.append("doop")

    assert_equal "doop", jb.to_string

    jb.append("deep")

    assert_equal "doop deep", jb.to_string
  end

  def test_jb_find_by_location_and_number
    jb = JungleBeat.new
    jb.append("deep woo shi shu blop")

    assert_equal nil, jb.find(6, 2)
    assert_equal "shi", jb.find(2, 1)
    assert_equal "woo shi shu", jb.find(1, 3)
    assert_equal "shu blop", jb.find(3, 2)
  end

  def test_jb_insert_to_location
    jb = JungleBeat.new

    jb.append("deep shi shu blop")

    jb.insert(1, "woo")

    assert_equal "deep woo shi shu blop", jb.to_string

    jb.insert(3, "poo")

    assert_equal "deep woo shi poo shu blop", jb.to_string
  end

  def test_jb_check_for_include
    jb = JungleBeat.new

    refute jb.includes?("doop")
    assert jb.includes?(nil)

    jb.append("deep woo shi shu blop")

    assert_equal "deep woo shi shu blop", jb.to_string
    assert jb.includes?("deep")
    refute jb.includes?("dep")
  end

  def test_jb_pop_last_node
    jb = JungleBeat.new
    assert_equal nil, jb.pop

    jb.append("deep woo shi shu blop")

    assert_equal "blop", jb.pop
    assert_equal "deep woo shi shu", jb.to_string
    assert_equal "shu", jb.pop
    assert_equal "deep woo shi", jb.to_string
    assert_equal "shi", jb.pop
    assert_equal "deep woo", jb.to_string
  end

  def test_jb_play
    jb = JungleBeat.new
    jb.append("deep doo ditt woo hoo shu")

    assert_equal "deep doo ditt woo hoo shu", jb.to_string
    assert_equal 6, jb.count
    assert_equal 6, jb.list.count
    jb.play
  end

  def test_allowed_beat_append
    jb = JungleBeat.new
    jb.append("Mississippi")

    assert_equal nil, jb.list.head.data

    jb.append("tee dee dop Oklahoma")

    assert_equal "tee dee dop", jb.to_string
  end

  def test_allowed_beat_prepend
    jb = JungleBeat.new
    jb.prepend("Mississippi")

    assert_equal nil, jb.list.head.data

    jb.prepend("tee dee dop Oklahoma")

    assert_equal "tee dee dop", jb.to_string
  end
end
