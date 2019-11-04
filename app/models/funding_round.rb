class FundingRound

  attr_reader :startup, :venture_capitalist
  attr_accessor :type, :investment

  @@all = []

  def self.all
    @@all
  end

  def initialize (startup, founder, type, amount)
    @startup = startup
    @venture_capitalist = founder
    @type = type
    @investment = amount

    @@all << self
  end

end
