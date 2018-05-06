require_relative 'h_node.rb'
require_relative 'Tree.rb'
class Huffman

  def initialize
    @nodes = []
    @base_nodes = []
    @all_nodes = []
  end

  def setup_nodes(probs, symbols)
    for i in 0..probs.size-1
      node_probability = probs[i]
      node_symbol = symbols[i]
      root_data = HNode.new(node_probability, node_symbol)
      root = Tree.new(root_data)
      @nodes.push(root)
      @base_nodes.push(root)
    end
  end
  def encode(d)
    while @nodes.size > 2
      create_tree(d)
      #puts 'tree made'
    end
    if @nodes.size==2
      create_head_node(d)
    end
    create_code(@nodes[0])
    # print_tree(@nodes[0])
  end

  def decode(bits)
    root = @nodes[0]
    @nodes = []
    decode_tree(root)
    found = false
    message = ''
    search_bits = ''
    bit_string = bits.chomp
    bit_string.split('').each do |bits|
      search_bits += bits
      @nodes.each do |node|
        code = node.data.code
        if code == search_bits
          message += node.data.symbol
          search_bits = ''
          found = true
        else
          found = false
        end
      end
    end
    if found then print "Word = #{message}"
    else print 'No message for those bits'
    end
  end

  def create_head_node(num_of_children)
    root_probability = @nodes[0].data.probability +  @nodes[1].data.probability
    root_symbol = ''
    root_symbol +=  @nodes[0].data.symbol.to_s
    root_symbol +=  @nodes[1].data.symbol.to_s
    #puts "new prob: #{root_probability.to_s}, new symbol: #{root_symbol}"
    root_data = HNode.new(root_probability,root_symbol)
    root = Tree.new(root_data)
    for i in 0..num_of_children-1
      if(@nodes[i]==nil)
        dummy = HNode.new(0, 'dummy', i)
        root.add_child(dummy)
      else
        @nodes[i].data.code = i
        root.add_child(@nodes[i])
      end
    end
    remove_nodes(num_of_children)
    @nodes.push(root)
    @all_nodes.push(root)
    #puts @nodes.size.to_s
  end
  def create_tree(num_of_children)
    root_probability=0
    root_symbol = ""
    for i in 0..num_of_children-1

      if(@nodes[i]==nil)
        #puts 'Ddummmmmy'
        root_probability+=0
        root_symbol += ''
      else
        @nodes[i].data.code = i
        root_probability+=@nodes[i].data.probability.to_f
        root_symbol += @nodes[i].data.symbol.to_s
      end
    end
    #puts "new prob: #{root_probability.to_s}, new symbol: #{root_symbol}"
    root_data = HNode.new(root_probability,root_symbol)
    root = Tree.new(root_data)
    for i in 0..num_of_children-1
      if(@nodes[i].nil?)
        #puts 'Ddummmmmy'
        dummy_data = HNode.new(0, '', i)
        dummy_root = Tree.new(dummy_data)
        root.add_child(dummy_root)
      else
        root.add_child(@nodes[i])
      end

    end
    @nodes.push(root)
    @all_nodes.push(root)
    remove_nodes(num_of_children)
  end

  def remove_nodes(num_of_nodes)
    j=0
    for i in 0..num_of_nodes-1
      #puts "node #{i} removed"
      @nodes.delete_at(j)
    end
    sort_nodes_array
  end

  def sort_nodes_array
    @nodes.sort!{|n1,n2| n1.data.probability <=> n2.data.probability}
  end

  def decode_tree(root)
    if(root.nil?)
      #error
    else
      children = root.get_children
      if(children.size == 0)
        @nodes.push(root)
      else
        for i in 0..children.size-1
          if(children[i].class==HNode)
            #of class node, needs to be of type tree
          else
            decode_tree(children[i])
          end
        end
      end
    end
  end

  def average_code_length
    sum = 0
    amount = @base_nodes.size
    for i in 0..amount-1
      sum += @base_nodes[i].data.probability * @base_nodes[i].data.code.length
    end
    puts "average code length: #{sum}"
  end

  def create_code(root)
    if(root.nil?)
      #error
    else
      children = root.get_children
      if(children.size == 0)
        #puts root.data.code.to_s
      else
        for i in 0..children.size-1
          if(children[i].class==HNode)
            #of class node, needs to be of type tree
          else
            #puts children[i].to_s
            children[i].data.code = root.data.code.to_s + children[i].data.code.to_s
            create_code(children[i])
          end

        end
      end
    end

  end

  def node_probs_to_s
    for i in 0..@nodes.size-1
      puts 'symbol: '+@nodes[i].data.symbol.to_s + ' probability: '+@nodes[i].data.probability.to_s
    end
  end
  def print_huffman
    for i in 0..@base_nodes.size-1
      puts 'symbol: '+@base_nodes[i].data.symbol.to_s + ' probability: '+@base_nodes[i].data.probability.to_s + ' code: '+@base_nodes[i].data.code.to_s
    end
  end
end


