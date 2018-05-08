class Tree

  attr_accessor :data, :children
  def initialize(data, child_nodes=nil)
    @data = data
    @children = child_nodes.equal?(nil) ? [] : child_nodes
  end

  def add_child(child)
    @children.push(child)
  end

  def get_children
    return @children
  end
end