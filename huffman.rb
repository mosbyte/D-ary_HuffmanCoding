require_relative 'h_node.rb'
require_relative 'tree.rb'
class Huffman

  def initialize
    @nodes = []
    @base_nodes = []
  end

  def encode(probs, symbols,d)
    #setup nodes
    for i in 0..probs.size-1
      node_probability = probs[i]
      node_symbol = symbols[i]
      root_data = HNode.new(node_probability, node_symbol)
      root = Tree.new(root_data)
      @nodes.push(root)
      @base_nodes.push(root)
    end
    #create codewords
    while @nodes.size > 1
      sort_nodes_array
      create_tree(d)
    end
    create_code(@nodes[0])
  end
  def encode_sequence(string)
    sequence = string.scan /\w/
    huffman_encoded = ''
    sequence.each do |x|
      @base_nodes.each do |z|
        if x == z.data.symbol
          huffman_encoded.concat(z.data.code.to_s)
        end
      end
    end
    # puts "Genetic Sequence = #{string}"
    # puts "Sequence Encoded =  #{huffman_encoded}"
    puts 'Encoding stored in file in same directory'
    return huffman_encoded

  end
  def decode(bits)
    root = @nodes[0]
    @nodes = []
    decode_tree(root)

    message = ''
    found = false
    curr_bits = ''
    bit_string = bits.chomp
    bit_string.split('').each do |bits|
      curr_bits.concat(bits)
      @nodes.each do |node|
        curr_node_codeword = node.data.code
        if curr_node_codeword == curr_bits
          message.concat(node.data.symbol)
          curr_bits = ''
          found = true
          break
        else
          found = false
        end
      end
    end
    if found
      puts 'Decoded Successfully and stored in file in same directory'
      return message
    else
      puts 'No message for those bits'
    end
  end

  def create_tree(num_of_children)
    root_probability=0
    root_symbol = ''
    for i in 0..num_of_children-1
      @nodes[i].data.code = i
      #puts @nodes[i].data.symbol.to_s
      root_probability+=@nodes[i].data.probability.to_f
      root_symbol += @nodes[i].data.symbol.to_s
    end
    # puts "new prob: #{root_probability.to_s}, new symbol: #{root_symbol}"
    root_data = HNode.new(root_probability,root_symbol)
    root = Tree.new(root_data)
    for i in 0..num_of_children-1
      root.add_child(@nodes[i])
    end
    remove_nodes(num_of_children)
    @nodes.push(root)
  end

  def create_code(root)
    if(root.nil?)
      #error
    else
      children = root.get_children
      if(children.size == 0)
        # puts root.data.code.to_s
      else
        for i in 0..children.size-1
          # puts "symbol: #{children[i].data.symbol} code:#{children[i].data.code.to_s}"
          children[i].data.code = root.data.code.to_s + children[i].data.code.to_s
          create_code(children[i])
        end
      end
    end

  end

  def remove_nodes(num_of_nodes)
    j=0
    for i in 0..num_of_nodes-1
      #puts "#{@nodes[j].data.symbol} deleted with code  #{@nodes[j].data.code} and children #{@nodes[j].get_children}"
      @nodes.delete_at(j)
    end
    #sort_nodes_array
  end

  def sort_nodes_array
    @nodes.sort!{|n1,n2| n1.data.probability <=> n2.data.probability}
    # nodes_order_to_s
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
          decode_tree(children[i])
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
    puts "expected code length: #{sum} bits"
    return sum
  end

  def entropy(base)
    sum = 0
    amount = @base_nodes.size
    for i in 0..amount-1
      i
      p = @base_nodes[i].data.probability.to_f
      if(p!=0)
        sum -= p* (Math.log(p,base))
      end
    end
    puts "Entropy: #{sum} bits"
    return sum
  end

  def node_probs_to_s
    for i in 0..@nodes.size-1
      puts 'symbol: '+@nodes[i].data.symbol.to_s + ' probability: '+@nodes[i].data.probability.to_s
    end
  end

  def print_huffman
    for i in 0..@base_nodes.size-1
      puts 'symbol: '+@base_nodes[i].data.symbol.to_s + ' p(x): '+@base_nodes[i].data.probability.to_s + ' code: '+@base_nodes[i].data.code.to_s
    end
  end
end




