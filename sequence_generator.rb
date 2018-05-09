class SequenceGenerator

  def function(n,probabilities,symbols)

    px1 = probabilities[0]
    px2 = px1 + probabilities[1]
    px3 = px2 + probabilities[2]
    px4 = px3 + probabilities[3]

    str = ''
    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0

    for i in 0..n
      val = rand(n)
      x = (val.to_f/n).to_f
      if x <= px1
        x1 += 1
        str += symbols[0]
      elsif x>px1 && x <= px2
        x2 += 1
        str += symbols[1]
      elsif x>px1 && x <= px3
        x3 += 1
        str += symbols[2]
      elsif x>px1 && x <= px4
        x4 += 1
        str += symbols[3]
      end
    end
    emp1 =  x1.to_f/n
    emp2 =  x2.to_f/n
    emp3 =  x3.to_f/n
    emp4 =  x4.to_f/n

    puts "Empirical frequency vs pmf of x: #{emp1}  vs  #{px1} ...variance between them is #{emp1 - (px1)}"
    puts "Empirical frequency vs pmf of x: #{emp2}  vs  #{px2-px1} ...variance between them is #{emp1 - (px2-px1)}"
    puts "Empirical frequency vs pmf of x: #{emp3}  vs  #{px3-px1} ...variance between them is #{emp1 - (px3-px1)}"
    puts "Empirical frequency vs pmf of x: #{emp4}  vs  #{px4-px3} ...variance between them is #{emp1 - (px4-px3)}"

    puts"\n"
    #puts str
    return str
  end
end
