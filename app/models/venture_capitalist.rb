class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth =total_worth

        @@all << self

    end ##initialize

    def self.all
        @@all
    end ### all

    def self.tres_commas_club
        self.all.select{|venture_capitalist| venture_capitalist.total_worth > 1_000_000_000}

    end ### tres commas

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)

    end ### offer_contract

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end ###funding_rounds

    def portfolio
        funding_rounds.map{|funding_round| funding_round.startup}.uniq
    end ##portfolio

    def biggest_investment
         funding_rounds.max_by{|funding_round| funding_round.investment}
        
    end ###biggest_investment

    def invested(domain)
        funding_rounds.select{|funding_round| funding_round.startup.domain == domain}.sum{|funding_round| funding_round.investment}
        
    end ##invested

end  ### class