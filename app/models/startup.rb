class Startup

  attr_reader :founder, :domain
  attr_accessor :name

  @@all = []
  def self.all
    @@all
  end

  def initialize (name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot (domain, name)
    self.name = name
    @domain = domain
  end

  def self.find_by_founder (founder)
    self.all.find{|co| co.founder == founder}
  end

  def self.domains
    self.all.map{|comp| comp.domain}
  end

  def sign_contract (capitalist, type, amount)
    FundingRound.new(self, capitalist, type, amount)
  end

  def rounds
    FundingRound.all.select{|round| round.startup == self}
  end

  def num_funding_rounds
    self.rounds.length
  end

  def total_funds
    self.rounds.reduce(0.0) do
      |memo, round|
      memo += round.investment
      memo = memo.round(2)
    end
  end

  def investors
    self.rounds.map {|round| round.venture_capitalist}
  end

  def big_investors
    billions = VentureCapitalist.tres_commas_club
    investor_list = self.investors.select {|inv| billions.include?(inv)}
  end



end
