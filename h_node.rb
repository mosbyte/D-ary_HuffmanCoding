class HNode

  attr_accessor :probability, :symbol, :code
  def initialize(probability, symbol = nil, code = nil)
    @probability = probability
    @symbol = symbol
    @code = code
  end
end