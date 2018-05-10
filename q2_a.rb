require_relative 'sequence_generator'
class Q2A

  puts "Please specify your value for N, the length of the genetic sequence e.g 10000\n\nBeware...Genetic sequences with over 100000 characters may take a few minutes"
  puts 'Genetic sequence length:'
  n = gets.chomp.to_i
  if n>100000
    puts 'This may take some time...'
  end
  probabilities = [0.2141, 0.2648, 0.3207, 0.2004]
  symbols = %w(A T C G)
  q2 = SequenceGenerator.new
  x = q2.function(n,probabilities,symbols)
  puts 'would you like to print the generated sequence to the screen? y/n'
  print_answer = gets.chomp

  if print_answer == 'y'
    puts 'Generated Sequence'
    puts x
  end

end