require_relative 'huffman'

class Test

  probabilities = [0.1, 0.1, 0.25, 0.25, 0.1, 0.2]
  sequence = "000110111011001111110101010"
  symbols = []
  d = 2
  num = ((probabilities.size-1).to_f / (d-1)).to_f

  if num%1!=0
    probabilities.push(0)
  end
  for i in 0..probabilities.size-1
    symbols.push('x'+i.to_s)
  end

  huffman = Huffman.new
  huffman.encode(probabilities,symbols,d)
  puts "\nHuffman code for each probability:"
  huffman.print_huffman
  huffman.average_code_length
  huffman.entropy(d)
  puts 'Input is 0001101110110011111 and base is 2'
  huffman.decode(sequence)

  puts 3.0%1!=0
end