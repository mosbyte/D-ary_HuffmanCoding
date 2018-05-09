require_relative 'sequence_generator'
class Q2A

  n = 10000
  probabilities = [0.2141, 0.2648, 0.3207, 0.2004]
  symbols = ["A","T","C","G"]
  q2 = SequenceGenerator.new
  puts q2.function(n,probabilities,symbols)
end