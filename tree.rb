class Tree

  attr_accessor :data, :children, :parent
  def initialize(data, child_nodes=nil, parent=nil)
    @data = data
    @parent = parent
    @children = child_nodes.equal?(nil) ? [] : child_nodes
  end

  def add_child(child)
    @children.push(child)
  end

  def set_parent(root)
    @parent = root
  end
  def get_children
    return @children
  end
end