require_relative 'tree'
require_relative 'huffman'
require_relative 'h_node'

class Question1Run

  # array = Array.new
  # puts 'Enter the number D the ary value for this huffman code'
  # d = gets.chomp.to_i
  # puts "enter probabilities individually stop by hitting enter twice:\nX0:"
  # sum=0
  # yn = gets.chomp
  # array << yn
  # sum += yn.to_f
  # i=1
  #
  # while yn != '' && sum<1.0
  #   print "x#{i}: "
  #   yn = gets.chomp
  #   array << yn
  #   sum+=yn.to_f
  #   if(sum>1.0)
  #     puts 'Probabilities dont add up to 1'
  #   else
  #     puts "Total Probability so far: #{sum}"
  #     i+=1
  #   end
  # end
  # probabilities =  []
  # for i in 0..array.size-1
  #   probabilities << array[i].to_f
  # end
  # puts probabilities


  probabilities = [0.1, 0.1, 0.25, 0.25, 0.1, 0.2]
  # probabilities = [0.2857,0.2391,0.1429,0.1905,0.0476,0.0952]
  d = 4
  num = ((probabilities.size-1).to_f / (d-1)).to_f

  if(!(num%1==0))
    probabilities.push(0)
  end
  symbols = []
  for i in 0..probabilities.size-1
    symbols.push('x'+i.to_s)
  end
  huffman = Huffman.new
  huffman.setup_nodes(probabilities,symbols)
  huffman.encode(d)
  puts 'Huffman code for each probability:'
  huffman.print_huffman
  huffman.average_code_length
  huffman.entropy(d)

  # probabilities = [0.1, 0.1, 0.25, 0.25, 0.1, 0.2]
  # puts 'Input is 0001101110110011111 and base is 2'
  # huffman.decode("000110111011001111110101010")

end