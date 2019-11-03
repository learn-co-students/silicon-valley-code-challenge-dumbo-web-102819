class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth 

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        all.select do |venture_capalist|
            venture_capalist.total_worth >= 1_000_000_000
        end
    end

    def offer_contract(startup,type,amount)
        FundingRound.new(startup,self,type,amount)
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
    end

    def portfolio
        funding_rounds.map { |funding_round| funding_round.startup }.uniq
    end

    def biggest_investment
        funding_rounds.max_by { |round| round.investment }
    end

    def invested(domain_name)
        domains_rounds = funding_rounds.select { |round| round.startup.domain == domain_name }
        domains_rounds.map { |domain| domain.investment }.reduce(:+)

    end
end
