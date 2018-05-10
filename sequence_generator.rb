class SequenceGenerator

  def function(n,probabilities,symbols)

    px1 = probabilities[0].round(4)
    px2 = px1 + probabilities[1].round(4)
    px3 = px2 + probabilities[2].round(4)
    px4 = px3 + probabilities[3].round(4)

    str = ''
    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0

    for i in 0..n
      val = rand(n)
      x = (val.to_f/n).round(4).to_f
      if x <= px1
        x1 += 1
        str.concat(symbols[0])
      elsif x>px1 && x <= px2
        x2 += 1
        str.concat(symbols[1])
      elsif x>px1 && x <= px3
        x3 += 1
        str.concat(symbols[2])
      elsif x>px1 && x <= px4
        x4 += 1
        str.concat(symbols[3])
      end
    end
    emp1 =  (x1.to_f/n).round(4).to_f
    emp2 =  (x2.to_f/n).round(4).to_f
    emp3 =  (x3.to_f/n).round(4).to_f
    emp4 =  (x4.to_f/n).round(4).to_f

    puts "Empirical frequency vs pmf of x: #{emp1}  vs  #{px1.round(4)} ...variance between them is #{(emp1 - (px1)).round(4)}"
    puts "Empirical frequency vs pmf of x: #{emp2}  vs  #{(px2-px1).round(4)} ...variance between them is #{(emp1 - (px2-px1)).round(4)}"
    puts "Empirical frequency vs pmf of x: #{emp3}  vs  #{(px3-px1).round(4)} ...variance between them is #{(emp1 - (px3-px1)).round(4)}"
    puts "Empirical frequency vs pmf of x: #{emp4}  vs  #{(px4-px3).round(4)} ...variance between them is #{(emp1 - (px4-px3)).round(4)}"

    puts"\n"
    return str
  end
end
