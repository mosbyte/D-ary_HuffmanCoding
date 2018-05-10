require_relative 'use_huffman'
require_relative 'sequence_generator'
class Q2B


  n = 1000000
  probabilities = [0.2141, 0.2648, 0.3207, 0.2004]
  symbols = %w(A T C G)
  q2 = SequenceGenerator.new
  puts "\nPlease wait for encoding...\n"
  puts "\n***Emperical frequency from the generation of the sequence***\n\n"
  sequence  = q2.function(n,probabilities,symbols)

  huffman = UseHuffman.new
  puts "\n*** For D=4 ***\n"
  huffman.huffman(probabilities,symbols,4,sequence)

  puts "\n*** For D=2 ***\n"
  huffman.huffman(probabilities,symbols,2,sequence)

  puts "\n*** For D=3 ***\n"
  huffman.huffman(probabilities,symbols,3,sequence)

end