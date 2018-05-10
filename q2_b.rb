require_relative 'use_huffman'
require_relative 'sequence_generator'
class Q2B

  puts ''
  puts "Please specify your value for N, the length of the genetic sequence e.g 10000\n\nBeware...Genetic sequences with over 100000 characters may take a few minutes"
  puts 'Genetic sequence length:'
  n = gets.chomp.to_i
  puts ''
  puts "Now enter a 2,3 or 4 to state the D value for the genetic sequence encoding'"
  d = gets.chomp.to_i

  while d>5 && d<1
    puts '*Can not be encoded using that D-ary value, Please enter 2,3 or 4*'
    d = gets.chomp.to_i
  end
  if n>100000
    puts 'This may take some time...'
  end

  probabilities = [0.2141, 0.2648, 0.3207, 0.2004]
  symbols = %w(A T C G)
  q2 = SequenceGenerator.new
  puts "\nPlease wait for encoding...\n"
  puts "\n***Empirical frequency from the generation of the sequence***\n\n"
  sequence  = q2.function(n,probabilities,symbols)

  huffman = UseHuffman.new
  puts "\n*** For D=#{d} ***\n"
  huffman.huffman(probabilities,symbols,d,sequence)

end