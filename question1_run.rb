require_relative 'tree.rb'
require_relative 'huffman.rb'
require_relative 'h_node.rb'

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
  probabilities = [0.1, 0.15, 0.2, 0.25, 0.1, 0.2]
  d = 3
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
# puts 'Input is 1000111100101'
# huffman.decode("1000111100101")
  puts 'Input is 00010201121011'
  huffman.decode("00010201121011")
end