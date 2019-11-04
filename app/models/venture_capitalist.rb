class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def self.all
    @@all
  end

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.tres_commas_club
    self.all.select{|founder| founder.total_worth >= 1_000_000_000}
  end

  def offer_contract (startup, investment_type, amount)
    FundingRound.new(startup, self, investment_type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    Startup.all.select {|biz| biz.founder == self.name}
  end

  def biggest_investment
    self.funding_rounds.reduce(0) do
    |memo, round|
    if round.investment > memo
      memo = round.investment
    end
    memo
    end
  end

  def invested(domain)
    self.funding_rounds.reduce do
      |memo, rounds|
      if rounds.startup.domain == domain
        memo += rounds.investment
      end
      memo
    end
  end


end
