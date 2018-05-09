require_relative 'tree'
require_relative 'huffman'
require_relative 'h_node'

class UseHuffman

  def run_with_input
    array = Array.new
    puts 'Enter the number D the ary value for this huffman code either D=2 D=3 or D=4'
    d = gets.chomp.to_i
    if d>=5
      run
    end
    puts "enter probabilities individually stop by hitting enter twice:\nX0:"
    sum=0
    yn = gets.chomp
    array << yn
    sum += yn.to_f
    i=1

    while sum<0.9999999
      print "x#{i}: "
      yn = gets.chomp
      array << yn
      sum+=yn.to_f
      if(sum>1.0)
        puts 'Probabilities dont add up to 1'
      else
        puts "Total Probability so far: #{sum}"
        i+=1
      end
    end
    probabilities =  []
    for i in 0..array.size-1
      probabilities << array[i].to_f
    end

    num = ((probabilities.size-1).to_f / (d-1)).to_f

    if num%1!=0
      probabilities.push(0)
    end
    symbols = []
    for i in 0..probabilities.size-1
      symbols.push('x'+i.to_s)
    end
    huffman = Huffman.new
    huffman.setup_nodes(probabilities,symbols)
    huffman.encode(d)
    puts "\nHuffman code for each probability:"
    huffman.print_huffman
    huffman.average_code_length
    huffman.entropy(d)

    puts "\nWould you like to go again y/n ?"
    yn = gets.chomp
    if(yn=='y')
      run
    end
  end

  def huffman(probabilities,letters,d,sequence)
    symbols = letters
    num = ((probabilities.size-1).to_f / (d-1)).to_f
    if(num%1!=0)
      probabilities.push(0)
    end
    for i in 0..probabilities.size-1
      symbols.push("D")
    end
    huffman = Huffman.new
    huffman.setup_nodes(probabilities,symbols)
    huffman.encode(d)
    puts "\nHuffman code for each probability:"
    huffman.print_huffman
    huffman.average_code_length
    huffman.entropy(d)
    puts ""
    str = huffman.encode_sequence(sequence)
    huffman.decode(str)

  end

end
