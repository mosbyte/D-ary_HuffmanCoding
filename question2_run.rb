require_relative 'tree'
require_relative 'huffman'
require_relative 'h_node'

class Question2Run

  probabilities = [0.2141, 0.2648, 0.3207, 0.2004]
  d = 3
  symbols = ["A","T","C","G"]
  huffman = Huffman.new
  huffman.setup_nodes(probabilities,symbols)
  huffman.encode(d)
  huffman.print_huffman
  # puts "DEcoding 01111000"
  # huffman.decode("01111000")
  puts "Decoding 0101110012"
  huffman.decode("0101110012")

  huffman.average_code_length
end