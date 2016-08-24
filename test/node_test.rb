require "../lib/node"
require "minitest/autorun"
require "minitest/pride"

class NodeTest < Minitest::Test
  def test_node_can_be_created
    node = Node.new("plop")
    assert_equal Node, node.class
  #  assert_instance_of Node, node.data
    assert_equal "plop", node.data
  end

  def test_next_node_nil
    node = Node.new("plop")

    assert_equal nil, node.next_node
  end
end
